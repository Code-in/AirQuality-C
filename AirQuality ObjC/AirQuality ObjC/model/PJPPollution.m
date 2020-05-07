//
//  PJPPollution.m
//  AirQuality ObjC
//
//  Created by Pete Parks on 5/6/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

#import "PJPPollution.h"

@implementation PJPPollution

-(instancetype)initWithAirQuality:(NSInteger)airQualityIndex {
    if (self = [super init]) {
        _airQualityIndex = airQualityIndex;
    }
    return self;
}
@end

@implementation PJPPollution (JSONConvertable)


-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)airQualityDictionary {
    //NSDictionary *pollution = airQualityDictionary[@"pollution"];
    NSInteger airQuality = [airQualityDictionary[@"aqius"] integerValue];
    return [self initWithAirQuality: airQuality];
}

@end
