//
//  DataBinding.m
//  TestApp
//
//  Created by Halin on 11/10/15.
//  Copyright (c) 2015 me.halin. All rights reserved.
//

#import "DataBindingUtil.h"
#import "ViewBinder.h"


@interface DataBindingUtil ()

/**保存绑定信息的table*/
@property (nonatomic,strong) NSMapTable *bindingTable;

@end

@implementation DataBindingUtil


+ (DataBindingUtil *)dataBindingUtil{
    static DataBindingUtil *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[self alloc] init];
    });
    return singleton;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _bindingTable = [NSMapTable weakToStrongObjectsMapTable];
    }
    return self;
}

/**添加bind的view*/
- (void)addBindingField:(NSString *)field bindingMethod:(NSString *)method forView:(UIView *)view{
    
    ViewBinder *binding = [self binderForView:view];
    binding.fieldMethodDictionary[field] = method;
}

/**为view绑定指定的binding类型*/
- (void)addModelType:(NSString *)modelType forView:(UIView *)view{
    ViewBinder *binding = [self binderForView:view];
    binding.modelType = modelType;
}

/**为view绑定identifier*/
- (void)addModelIdentifier:(NSString *)identifier forView:(UIView *)view{
    ViewBinder *binding = [self binderForView:view];
    binding.identifier = identifier;
}

- (ViewBinder *)binderForView:(UIView *)view{
    ViewBinder *binding = [_bindingTable objectForKey:view];
    if (!binding) {
        binding = [[ViewBinder alloc] init];
        binding.view = view;
        [_bindingTable setObject:binding forKey:view];
    }
    return binding;
}

/**将model绑定到指定的view*/
- (void)bindModel:(id)model forView:(UIView *)view{

    ViewBinder *binding = [_bindingTable objectForKey:view];
    if (binding) {
        //view存在binding
        if (!binding.modelType || [model isKindOfClass:NSClassFromString(binding.modelType)]) {
            //没有指定binding期望类型或者model类型与binding期望的类型相同,绑定
            if (!binding.identifier || ([model conformsToProtocol:@protocol(IdentifierModel)] && [binding.identifier isEqualToString:[model identifier]])) {
                
                //binding不需要指定identifier 或者 binding 指定id与model的identifier相同,绑定
                [binding bind:model];
            }
        }
    }
    
    for (UIView *subview in view.subviews) {
        [self bindModel:model forView:subview];
    }
}

/**从view中获得绑定的model*/
- (id)getModel:(UIView *)view{
    ViewBinder *binding =[_bindingTable objectForKey:view];
    if (!binding) {
        return nil;
    }
    
    return binding.model;
}


- (void)unbindModel:(id)model{
    NSEnumerator *enumerator = [_bindingTable objectEnumerator];
    ViewBinder *binding;
    while (binding = [enumerator nextObject]) {
        if (binding.model == model) {
            //binding都是一次性使用,解绑时直接移除
            [binding unbind];
            [self.bindingTable removeObjectForKey:binding.view];                //NSMapTable虽然会自动释放掉object,但自行释放可以提高效率
        }
    }
}

@end
