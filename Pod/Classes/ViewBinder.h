//
//  ViewBinder.h
//  TestApp
//
//  Created by Halin on 11/11/15.
//  Copyright (c) 2015 me.halin. All rights reserved.
//

#import <UIKit/UIKit.h>

/**与view一一对应的binding,保存所有绑定信息,实现绑定*/
@interface ViewBinder : NSObject

/**要set的view*/
@property (nonatomic,weak) UIView *view;

/**监听的对象,此处必须使用assign,否则当model回收时,此处model将被置空,无法解绑*/
@property (nonatomic,assign,readonly) id model;

/**要监听的类型*/
@property (nonatomic,copy) NSString *modelType;

/**key:field,监听哪个属性 value:method,属性变化时执行的方法 保存监听的field和method的字典*/
@property (nonatomic,strong) NSMutableDictionary *fieldMethodDictionary;

/**绑定*/
- (void)bind:(id)model;

/**解绑*/
- (void)unbind;

@end

