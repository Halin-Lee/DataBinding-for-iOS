//
//  ExampleModel.h
//  Example
//
//  Created by Halin on 11/11/15.
//  Copyright (c) 2015 me.halin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DataBindingLib/DataBindingLib.h>
@interface ExampleModel : NSObject <IdentifierModel>
@property (nonatomic,copy) NSString *string;
@property (nonatomic,strong) UIColor *color;
@property (nonatomic,copy) NSString *identifier;
@end
