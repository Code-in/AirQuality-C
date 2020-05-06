//
//  PJPWeather.h
//  AirQuality ObjC
//
//  Created by Pete Parks on 5/6/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PJPWeather : NSObject

@property (nonatomic, readonly)float tempature;
@property (nonatomic, readonly)float humidity;
@property (nonatomic, readonly)float windSpeed;

-(instancetype)initWithTempature:(float)tempature humidity:(float)humidity windSpeed:(float)windSpeed;
@end

@interface PJPWeather (JSONConvertable)
-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)weatherDicitonary;

@end


NS_ASSUME_NONNULL_END
