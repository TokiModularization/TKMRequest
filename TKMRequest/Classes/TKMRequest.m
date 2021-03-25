//
//  TKMRequest.m
//  TKMRequest
//
//  Created by Thief Toki on 2021/3/25.
//

#import "TKMRequest.h"

@interface TKMRequest ()

@property (nonatomic, strong) NSString *baseURL;
@property (nonatomic, strong) NSDictionary *(^baseHeaderHook)(void);
@property (nonatomic, strong) NSDictionary *(^baseParamHook)(void);

@end

@implementation TKMRequest

#pragma mark - shared

+ (instancetype)shared {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

#pragma mark -

- (void)registerBaseURL:(NSString *)baseURL
         baseHeaderHook:(NSDictionary *(^)(void))baseHeaderHook
          baseParamHook:(NSDictionary *(^)(void))baseParamHook {
    //域名或请求根路径
    self.baseURL = baseURL;
    //获取HTTPHeader的钩子
    self.baseHeaderHook = baseHeaderHook;
    //获取通用参数的钩子
    self.baseParamHook = baseParamHook;
}

- (void)requestPath:(NSString *)path
         parameters:(NSDictionary *)parameters
           callback:(void(^)(NSDictionary *response, NSError *error))callback {
    //通过传参和基础参数拼接完整的请求内容
    NSString *URL = [self.baseURL stringByAppendingString:path];
    NSDictionary *header = self.baseHeaderHook();
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithDictionary:self.baseParamHook()];
    [param addEntriesFromDictionary:parameters];
    //发起请求
    [self requestURL:URL
              header:header
          parameters:param
            callback:callback];
}

- (void)requestURL:(NSString *)URL
            header:(NSDictionary *)header
        parameters:(NSDictionary *)parameters
          callback:(void(^)(NSDictionary *response, NSError *error))callback {
    //模拟一个网络请求
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (callback) callback(@{@"message": @"Request simulation success"}, nil);
    });
}


@end
