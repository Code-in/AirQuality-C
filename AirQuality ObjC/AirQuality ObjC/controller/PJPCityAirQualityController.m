//
//  PJPCityAirQualityController.m
//  AirQuality ObjC
//
//  Created by Pete Parks on 5/6/20.
//  Copyright © 2020 Pete Parks. All rights reserved.
//

#import "PJPCityAirQualityController.h"
#import "PJPCityAirQuality.h"

static NSString *const baseURLString = @"https://api.airvisual.com";
static NSString *const versionComponent = @"v2";
static NSString *const countriesComponent = @"countries";
static NSString *const stateComponent = @"states";
static NSString *const cityComponent = @"cities";
static NSString *const cityKey = @"city";
static NSString *const stateKey = @"state";
static NSString *const countryKey = @"country";
static NSString *const keyKey = @"key";
static NSString *const apiKey = @"7166caa8-67c4-4313-a4ed-1410168719e9";



@implementation PJPCityAirQualityController


+ (void) fetchSupportedCountries: (void(^) (NSArray<NSString *> *countries, NSError *error))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    baseURL = [baseURL URLByAppendingPathComponent: versionComponent];
    baseURL = [baseURL URLByAppendingPathComponent: countriesComponent];
    NSURLQueryItem *queryItem = [[NSURLQueryItem alloc] initWithName:keyKey value:apiKey];
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:YES];
    components.queryItems = [NSArray arrayWithObjects: queryItem, nil];
    NSURL *finalURL = [components URL];
    
    NSLog(@"%@",finalURL.absoluteString);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        // error handling
        if(error) {
            NSLog(@"%@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        if(!data){
            NSLog(@"Error no data returned from task");
            completion(nil, error);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if(!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSONDictionary is not dictionary class");
            completion(nil, error);
            return;
        }
        NSArray *countryArray = jsonDictionary[@"data"];
        // Place holder array for return the data
        NSMutableArray *outCountryArray = [NSMutableArray array];
        
        for(NSDictionary *country in countryArray){
            [outCountryArray addObject: country[countryKey]];
        }
        completion(outCountryArray, nil);
    }] resume];
}

+ (void) fetchSupportedStatesInCountry: (NSString *) country completion:(void(^) (NSArray<NSString *> *states, NSError *error))completion {
        
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    baseURL = [baseURL URLByAppendingPathComponent: versionComponent];
    baseURL = [baseURL URLByAppendingPathComponent: stateComponent];
    NSURLQueryItem *queryItem1 = [[NSURLQueryItem alloc] initWithName:countryKey value:country.lowercaseString];
    NSURLQueryItem *queryItem2 = [[NSURLQueryItem alloc] initWithName:keyKey value:apiKey];
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:YES];
    components.queryItems = [NSArray arrayWithObjects: queryItem1, queryItem2, nil];
    NSURL *finalURL = [components URL];
    
    NSLog(@"%@",finalURL.absoluteString);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        // error handling
        if(error) {
            NSLog(@"%@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        if(!data){
            NSLog(@"Error no data returned from task");
            completion(nil, error);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if(!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSONDictionary is not dictionary class");
            completion(nil, error);
            return;
        }
        NSArray *statesArray = jsonDictionary[@"data"];
        // Place holder array for return the data
        NSMutableArray *outStatesArray = [NSMutableArray array];
        
        for(NSDictionary *state in statesArray){
            [outStatesArray addObject:state[stateKey]];
        }
        completion(outStatesArray, nil);
    }] resume];
    
}

+ (void) fetchSupportedCitiesInState: (NSString *) country state:(NSString *) state completion:(void(^) (NSArray<NSString *> *cities, NSError *error))completion {
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    baseURL = [baseURL URLByAppendingPathComponent: versionComponent];
    baseURL = [baseURL URLByAppendingPathComponent: cityComponent];
    NSURLQueryItem *queryItem1 = [[NSURLQueryItem alloc] initWithName:stateKey value:state.lowercaseString];
    NSURLQueryItem *queryItem2 = [[NSURLQueryItem alloc] initWithName:countryKey value:country.lowercaseString];
    NSURLQueryItem *queryItem3 = [[NSURLQueryItem alloc] initWithName:keyKey value:apiKey];
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:YES];
    components.queryItems = [NSArray arrayWithObjects: queryItem1, queryItem2, queryItem3, nil];
    NSURL *finalURL = [components URL];
    
    NSLog(@"%@",finalURL.absoluteString);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        // error handling
        if(error) {
            NSLog(@"%@", error.localizedDescription);
            completion(nil, error);
            return;
        }
        
        if(!data){
            NSLog(@"Error no data returned from task");
            completion(nil, error);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if(!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSONDictionary is not dictionary class");
            completion(nil, error);
            return;
        }
        NSArray *citiesArray = jsonDictionary[@"data"];
        // Place holder array for return the data
        NSMutableArray *outCitiesArray = [NSMutableArray array];
        
        for(NSDictionary *city in citiesArray){
            [outCitiesArray addObject:city[cityKey]];
        }
        completion(outCitiesArray, nil);
    }] resume];
    
}

+ (void) fetchDataForCity: (NSString *) country state:(NSString *) state city:(NSString *)city completion:(void(^) (PJPCityAirQuality * _Nullable))completion {
    
        NSURL *baseURL = [NSURL URLWithString:baseURLString];
        baseURL = [baseURL URLByAppendingPathComponent: versionComponent];
        baseURL = [baseURL URLByAppendingPathComponent: cityKey];
        NSURLQueryItem *queryItem1 = [[NSURLQueryItem alloc] initWithName:cityKey value:city];
        NSURLQueryItem *queryItem2 = [[NSURLQueryItem alloc] initWithName:stateKey value:state];
        NSURLQueryItem *queryItem3 = [[NSURLQueryItem alloc] initWithName:countryKey value:country];
        NSURLQueryItem *queryItem4 = [[NSURLQueryItem alloc] initWithName:keyKey value:apiKey];
        NSURLComponents *components = [[NSURLComponents alloc] initWithURL:baseURL resolvingAgainstBaseURL:YES];
        components.queryItems = [NSArray arrayWithObjects: queryItem1, queryItem2, queryItem3, queryItem4, nil];
        NSURL *finalURL = [components URL];
        
        NSLog(@"%@",finalURL.absoluteString);
        
        [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            
            // error handling
            if(error) {
                NSLog(@"%@", error.localizedDescription);
                completion(nil);
                return;
            }
            
            if(!data){
                NSLog(@"Error no data returned from task");
                completion(nil);
                return;
            }
            
            NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            if(!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
                NSLog(@"JSONDictionary is not dictionary class");
                completion(nil);
                return;
            }
            
            PJPCityAirQuality *outAirQuality = [[PJPCityAirQuality alloc] initWithDictionary: jsonDictionary];
            
            completion(outAirQuality);
        }] resume];
        
    }







@end
