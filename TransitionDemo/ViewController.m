//
//  ViewController.m
//  TransitionDemo
//
//  Created by zhangyan on 2017/4/27.
//  Copyright © 2017年 zhangyan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSDictionary *dic1 = @{@"a":@"1"};
    NSDictionary *dic2 = @{@"b":@"2"};
    NSArray *array = @[@"1",@"1",@"1",@"1",@"1",@"1",dic1,dic2];
    NSString *arrayStr = [self transformationToString:array];
    NSLog(@"arrayStr == \n%@",arrayStr);
    
    
    NSDictionary *tempDic = @{@"name":@"张三",@"age":@(20),@"dic2":dic2};
    NSString *tempDicStr = [self transformationToString:tempDic];
    NSLog(@"字典转化后的结果是 == \n%@",tempDicStr);
    
    
    
}

/**字典或者数组转化成json串*/
- (NSString *)transformationToString:(id )transition{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:transition
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
        return @"转化失败";
        
    } else {
        
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
        return jsonString;
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
