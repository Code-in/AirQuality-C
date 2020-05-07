//
//  PJPWeather.m
//  AirQuality ObjC
//
//  Created by Pete Parks on 5/6/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

#import "PJPWeather.h"

@implementation PJPWeather

-(instancetype)initWithTempature:(float)tempature humidity:(float)humidity windSpeed:(float)windSpeed {
    if (self = [super init]) {
        _tempature = tempature;
        _humidity = humidity;
        _windSpeed = windSpeed;
    }
    return self;
}
@end

@implementation PJPWeather (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)weatherDictionary {
    float tempature = [weatherDictionary[@"tp"] floatValue];
    float humidity = [weatherDictionary[@"hu"] floatValue];
    float windSpeed = [weatherDictionary[@"ws"] floatValue];
    return [self initWithTempature:tempature humidity:humidity windSpeed:windSpeed];
}

@end
