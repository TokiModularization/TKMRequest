//
//  TKMRequest.h
//  TKMRequest
//
//  Created by Thief Toki on 2021/3/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TKMRequest : NSObject

+ (instancetype)shared;

- (void)registerBaseURL:(NSString *)baseURL
         baseHeaderHook:(NSDictionary *(^)(void))baseHeaderHook
          baseParamHook:(NSDictionary *(^)(void))baseParamHook;

- (void)requestPath:(NSString *)path
         parameters:(NSDictionary *)parameters
           callback:(void(^)(NSDictionary *response, NSError *error))callback;

@end

NS_ASSUME_NONNULL_END
