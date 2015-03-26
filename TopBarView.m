//
//  TopBarView.m
//  Gizmeondeals
//
//  Created by Gizmeon Technologies on 27/02/15.
//  Copyright (c) 2015 Gizmeon Technologies. All rights reserved.
//

#import "TopBarView.h"

#import "InterfaceManager.h"
#import "SlideNavigationController.h"
#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorSlide.h"

@implementation TopBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

 static TopBarView *instance=nil;
- (id) awakeAfterUsingCoder:(NSCoder*)aDecoder {
    
    BOOL theThingThatGotLoadedWasJustAPlaceholder = ([[self subviews] count] == 0);
    
    if (theThingThatGotLoadedWasJustAPlaceholder) {
        
        TopBarView* theRealThing = [[self class] loadFromNib];
        
        // pass properties through
        theRealThing.frame = self.frame;
        theRealThing.autoresizingMask = self.autoresizingMask;
        theRealThing.alpha = self.alpha;
        theRealThing.hidden = self.hidden;
        
        
        // convince ARC that we're legit
        CFRelease((__bridge const void*)self);
        CFRetain((__bridge const void*)theRealThing);
        

        
        
        return theRealThing;
    }
   // self.backgroundColor=[UIColor redColor];
    return self;

}
  - (IBAction)buttonActionMenu:(id)sender {
    
//    UIViewController * owner = [self getSuperViewController];
      
      
      static Menu menu = MenuLeft;
      
 
      [[SlideNavigationController sharedInstance] openMenu:menu withCompletion:nil];
      
      
}
 - (UIViewController*)getSuperViewController
    {
        for (UIView* next = [self superview]; next; next = next.superview)
        {
            UIResponder* nextResponder = [next nextResponder];
            
            if ([nextResponder isKindOfClass:[UIViewController class]])
            {
                return (UIViewController*)nextResponder;
            }
        }
        
        return nil;
    }

+ (id) loadFromNib {
    NSString* nibName = NSStringFromClass([self class]);
    NSArray* elements = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    for (NSObject* anObject in elements) {
        if ([anObject isKindOfClass:[self class]]) {
            return anObject;
        }
    }
    return nil;
}
@end
