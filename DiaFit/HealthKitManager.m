 //
//  DiaFitHealthKitManager.m
//  DiaFit
//
//  Created by Reynaldo Olivo on 2/5/16.
//  Copyright © 2016 Reynaldo Olivo. All rights reserved.
//

#import "HealthKitManager.h"
#import <HealthKit/HealthKit.h>



@interface HealthKitManager ()

@property (nonatomic, retain) HKHealthStore *healthStore;
@property (nonatomic) double totalSteps;

@end


@implementation HealthKitManager

+ (HealthKitManager *)sharedManager {
    static dispatch_once_t pred = 0;
    static HealthKitManager *instance = nil;
    dispatch_once(&pred, ^{
        instance = [[HealthKitManager alloc] init];
        instance.healthStore = [[HKHealthStore alloc] init];
    });
    return instance;
}

- (void)requestAuthorization {
        
        if([HKHealthStore isHealthDataAvailable]) {
            
            self.healthStore = [[HKHealthStore alloc] init];
            
            NSSet *writeDataTypes = [self dataTypesToWrite];
            
            NSSet *readDataTypes = [self dataTypesToRead];
            
            [self.healthStore requestAuthorizationToShareTypes:writeDataTypes readTypes:readDataTypes completion:^(BOOL success, NSError *error) {
                
                if(error) {
                    
                    NSLog(@"%@", error);
                    
                } else {
                    
                    NSLog(@"Success is %d", success);
                }
            }];
        }
    }
    
    - (NSSet *)dataTypesToWrite {
        
        /*HKQuantityType *bodyMass = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
        HKQuantityType *distanceCycling = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceCycling];
        
        return [NSSet setWithObjects:bodyMass, distanceCycling, nil];
         */
        return nil;
    }
    
    - (NSSet *)dataTypesToRead {
        
        HKQuantityType *stepCount = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
        HKCharacteristicType *dateOfBirth = [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth];
        
        return [NSSet setWithObjects:stepCount, dateOfBirth, nil];
    }

- (NSDate *)readBirthDate {
    NSError *error;
    NSDate *dateOfBirth = [self.healthStore dateOfBirthWithError:&error];   // Convenience method of HKHealthStore to get date of birth directly.
    
    if (!dateOfBirth) {
        NSLog(@"Either an error occured fetching the user's age information or none has been stored yet. In your app, try to handle this gracefully.");
    }
    
    return dateOfBirth;
}

- (double)readStepCount : (NSInteger) amtOfDays{
    __block double total = 0;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *interval = [[NSDateComponents alloc] init];
    interval.day = 1;
    
    NSDateComponents *anchorComponents = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear
                                                     fromDate:[NSDate date]];
    anchorComponents.hour = 0;
    NSDate *anchorDate = [calendar dateFromComponents:anchorComponents];
    HKQuantityType *quantityType = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    
    // Create the query
    HKStatisticsCollectionQuery *query = [[HKStatisticsCollectionQuery alloc] initWithQuantityType:quantityType
                                                                           quantitySamplePredicate:nil
                                                                                           options:HKStatisticsOptionCumulativeSum
                                                                                        anchorDate:anchorDate
                                                                                intervalComponents:interval];
    
    // Set the results handler
    query.initialResultsHandler = ^(HKStatisticsCollectionQuery *query, HKStatisticsCollection *results, NSError *error) {
        if (error) {
            // Perform proper error handling here
            NSLog(@"*** An error occurred while calculating the statistics: %@ ***",error.localizedDescription);
        }
        
        NSDate *endDate = [NSDate date];
        NSDate *startDate = [calendar dateByAddingUnit:NSCalendarUnitDay
                                                 value:(-1 * amtOfDays)
                                                toDate:endDate
                                               options:0];
        
        // Plot the daily step counts over the past 7 days
        [results enumerateStatisticsFromDate:startDate
                                      toDate:endDate
                                   withBlock:^(HKStatistics *result, BOOL *stop) {
                                       
                                       HKQuantity *quantity = result.sumQuantity;
                                       if (quantity) {
                                           NSDate *date = result.startDate;
                                           double value = [quantity doubleValueForUnit:[HKUnit countUnit]];
                                           NSLog(@"%@: %f", date, value);
                                           total += value;
                                       }
                                       
                                   }];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.totalSteps = total / (amtOfDays + 1); //this will return the average over the wanted time span.
        }
                       );
        NSLog(@"%f", total);
    };
    
    [self.healthStore executeQuery:query];
    return self.totalSteps;
}

- (void)writeWeightSample:(CGFloat)weight {
    /*
    // Each quantity consists of a value and a unit.
    HKUnit *kilogramUnit = [HKUnit gramUnitWithMetricPrefix:HKMetricPrefixKilo];
    HKQuantity *weightQuantity = [HKQuantity quantityWithUnit:kilogramUnit doubleValue:weight];
    
    HKQuantityType *weightType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
    NSDate *now = [NSDate date];
    
    // For every sample, we need a sample type, quantity and a date.
    HKQuantitySample *weightSample = [HKQuantitySample quantitySampleWithType:weightType quantity:weightQuantity startDate:now endDate:now];
    
    [self.healthStore saveObject:weightSample withCompletion:^(BOOL success, NSError *error) {
        if (!success) {
            NSLog(@"Error while saving weight (%f) to Health Store: %@.", weight, error);
        }
    }];*/
}

@end