//
//  UIView+DataBinding.m
//  TestApp
//
//  Created by Halin on 11/10/15.
//  Copyright (c) 2015 me.halin. All rights reserved.
//

#import "UIView+DataBinding.h"
#import "DataBindingUtil.h"
@implementation UIView(DataBinding)

- (void)setValue:(id)value forKey:(NSString *)key{
    
    //覆盖UIView原本的set事件,拦截BindMethod和BindType
    
    if ([key containsString:@"BindMethod:"]) {
        //绑定方法
        NSString *field = [key stringByReplacingOccurrencesOfString:@"BindMethod:" withString:@""];
        NSString *method = value;
        [[DataBindingUtil dataBindingUtil] addBindingField:field bindingMethod:method forView:self];
        
    }else if([key containsString:@"BindType"]){
        //设置绑定类型
        [[DataBindingUtil dataBindingUtil] addModelType:value forView:self];
        
    }else {
        [super setValue:value forKey:key];
    }
}



@end
