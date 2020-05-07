//
//  PJPCityAirQualityController.h
//  AirQuality ObjC
//
//  Created by Pete Parks on 5/6/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PJPCityAirQuality.h"

NS_ASSUME_NONNULL_BEGIN

@interface PJPCityAirQualityController : NSObject

+ (void) fetchSupportedCountries: (void(^) (NSArray<NSString *> *countries, NSError *error))completion;
+ (void) fetchSupportedStatesInCountry: (NSString *) country completion:(void(^) (NSArray<NSString *> *states, NSError *error))completion;
+ (void) fetchSupportedCitiesInState: (NSString *) country state:(NSString *) state completion:(void(^) (NSArray<NSString *> *cities, NSError *error))completion;
+ (void) fetchDataForCity: (NSString *) country state:(NSString *) state city:(NSString *)city completion:(void(^) (PJPCityAirQuality * _Nullable))completion;

@end


NS_ASSUME_NONNULL_END
