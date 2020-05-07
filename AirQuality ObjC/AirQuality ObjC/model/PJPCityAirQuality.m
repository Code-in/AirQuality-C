//
//  PJPAirQuality.m
//  AirQuality ObjC
//
//  Created by Pete Parks on 5/6/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

#import "PJPCityAirQuality.h"

@implementation PJPCityAirQuality



-(instancetype) initWithCityName:(NSString *)city state:(NSString *)state country:(NSString *)country weather:(PJPWeather *)weather pollution:(PJPPollution *)pollution {
    if (self = [super init]) {
        _city = city;
        _state = state;
        _country = country;
        _pollution = pollution;
        _weather = weather;
    }
    return self;
}

@end

@implementation PJPCityAirQuality (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)cityDictionary {
    NSDictionary *data = cityDictionary[@"data"];
    NSString *city = data[@"city"];
    NSString *state = data[@"state"];
    NSString *country = data[@"country"];
    PJPPollution *pollution = [[PJPPollution alloc] initWithDictionary:data[@"current"][@"pollution"] ];
    PJPWeather *weather = [[PJPWeather alloc] initWithDictionary:data[@"current"][@"weather"] ];
    
    return [self initWithCityName:city state:state country:country weather: weather pollution: pollution];
}

@end


