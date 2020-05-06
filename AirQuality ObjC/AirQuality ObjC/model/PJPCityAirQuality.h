//
//  PJPAirQuality.h
//  AirQuality ObjC
//
//  Created by Pete Parks on 5/6/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PJPPollution.h"
#import "PJPWeather.h"

NS_ASSUME_NONNULL_BEGIN

@interface PJPCityAirQuality : NSObject


@property (nonatomic, copy, readonly)NSString *city;
@property (nonatomic, copy, readonly)NSString *state;
@property (nonatomic, copy, readonly)NSString *country;


@property (nonatomic, readonly)PJPPollution *pollution;
@property (nonatomic, readonly)PJPWeather *weather;

-(instancetype) initWithCityName:(NSString *)city state:(NSString *)state country:(NSString *)country;


@end

@interface PJPCityAirQuality (JSONConvertable)
-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary;

@end


NS_ASSUME_NONNULL_END
