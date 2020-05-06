//
//  PJPPollution.h
//  AirQuality ObjC
//
//  Created by Pete Parks on 5/6/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PJPPollution : NSObject

@property (nonatomic, readonly)NSInteger airQualityIndex;

-(instancetype)initWithAirQuality:(NSInteger)airQualityIndex;

@end

@interface PJPPollution (JSONConvertable)
-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)airQualityDictionary;

@end

NS_ASSUME_NONNULL_END
