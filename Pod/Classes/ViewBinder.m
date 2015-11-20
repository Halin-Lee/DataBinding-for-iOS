//
//  ViewBinder.m
//  TestApp
//
//  Created by Halin on 11/11/15.
//  Copyright (c) 2015 me.halin. All rights reserved.
//

#import "ViewBinder.h"


@implementation ViewBinder

- (instancetype)init
{
    self = [super init];
    if (self) {
        _fieldMethodDictionary = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    
    if(!_view || !_model){
        //FIXME:待验证model不存在时回调是否会回收
        [_model removeObserver:self forKeyPath:keyPath];
    }else{
        NSString *method = _fieldMethodDictionary[keyPath];
        //监听正常时调用setter
//        [_view performSelector:NSSelectorFromString(method) withObject:[_model valueForKey:keyPath]];
        [_view setValue:[_model valueForKey:keyPath] forKeyPath:method];
    }
    
}

- (void)bind:(id)model{
    if (_model) {
        //已经有model绑定,跳过
        return;
    }
    _model = model;
    NSArray *keys = [_fieldMethodDictionary allKeys];
    for (NSString *field in keys) {
        //插入所有监听
        [model addObserver:self forKeyPath:field options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)unbind{
    //回收的时候移除所有监听
    NSArray *keys = [_fieldMethodDictionary allKeys];
    
    if (_model) {
        for (NSString *field in keys) {
            @try {
                [_model removeObserver:self forKeyPath:field];
            }@catch (NSException *exception) {
            }
        }
        _model = nil;
    }
}
- (void)dealloc{
    //回收的时候移除所有监听
    NSArray *keys = [_fieldMethodDictionary allKeys];
    
    if (_model) {
        for (NSString *field in keys) {
            @try {
                [_model removeObserver:self forKeyPath:field];
            }@catch (NSException *exception) {
            }
        }
        _model = nil;
    }
}

@end