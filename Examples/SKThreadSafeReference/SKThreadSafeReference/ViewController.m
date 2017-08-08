//
//  ViewController.m
//  SKThreadSafeReference
//
//  Created by Stepan Kopylov on 08/08/2017.
//  Copyright © 2017 Home. All rights reserved.
//

#import "ViewController.h"
#import <Realm.h>
#import "Foo.h"
#import "SKThreadSafeReference.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm beginWriteTransaction];
    
    Foo *testObject = [Foo new];
    testObject.bar = [NSString stringWithFormat:@"test %d", arc4random() % 100];
    
    [realm addObject:testObject];
    
    [realm commitWriteTransaction];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        RLMResults *result = [Foo allObjects];
        
        NSMutableArray <SKThreadSafeReference *> *safeReferences = @[].mutableCopy;
        
        for ( int i = 0; i < result.count; i++ ) {
            Foo *obj = result[i];
            
            SKThreadSafeReference *safeReference = [SKThreadSafeReference referenceWithThreadConfined:obj];
            
            [safeReferences addObject:safeReference];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [safeReferences enumerateObjectsUsingBlock:^(SKThreadSafeReference *_Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
                Foo *nonSafeObject = obj.nonSafeObject;
                
                NSLog(@"bar = %@", nonSafeObject.bar);
            }];
        });
    });
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
