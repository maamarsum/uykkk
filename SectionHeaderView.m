

#import "SectionHeaderView.h"
#import <QuartzCore/QuartzCore.h>
#import "ProductViewController.h"

@implementation SectionHeaderView

@synthesize titleLabel=_titleLabel, disclosureButton=_disclosureButton, delegate=_delegate, section=_section;


+ (Class)layerClass {
    
    return [CAGradientLayer class];
}


-(id)initWithFrame:(CGRect)frame title:(NSString*)title section:(NSInteger)sectionNumber delegate:(id <SectionHeaderViewDelegate>)delegate {
    
    self = [super initWithFrame:frame];
    
    if (self != nil) {
        
        // Set up the tap gesture recognizer.
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleOpen:)];
        [self addGestureRecognizer:tapGesture];
//        UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showaction)];
//        [self addGestureRecognizer:tapGesture2];
       

        _delegate = delegate;        
        self.userInteractionEnabled = YES;
        
        //create and configure detail button
        UIButton *detailbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        detailbtn.frame = CGRectMake(15.0, 5.0, 35.0, 35.0);
        [detailbtn setImage:[UIImage imageNamed:@"carat.png"] forState:UIControlStateNormal];
        [detailbtn setImage:[UIImage imageNamed:@"carat-open.png"] forState:UIControlStateSelected];
        [detailbtn addTarget:self action:@selector(toggleOpen:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:detailbtn];
        _DetailButton = detailbtn;

        
        // Create and configure the title label.
        _section = sectionNumber;
        CGRect titleLabelFrame = self.bounds;
        titleLabelFrame.origin.x += 80.0;
        titleLabelFrame.size.width -= 35.0;
        CGRectInset(titleLabelFrame, 0.0, 5.0);
        UILabel *label = [[UILabel alloc] initWithFrame:titleLabelFrame];
        label.text = title;
        label.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
        
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor clearColor];
        //label.layer.borderColor=[UIColor blackColor].CGColor;
        //label.layer.borderWidth=0.5;

        [self addSubview:label];
        _titleLabel = label;
        
        
//        // Create and configure the disclosure button.
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(210.0, 5.0, 35.0, 35.0);
//        [button setImage:[UIImage imageNamed:@"carat.png"] forState:UIControlStateNormal];
//        [button setImage:[UIImage imageNamed:@"carat-open.png"] forState:UIControlStateSelected];
//            [button addTarget:self action:@selector(showaction) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:button];
//        _disclosureButton = button;
        
     }
    
    return self;
}

-(void)nextpage{
    [[self delegate]hideview:@"y"];

}

-(IBAction)toggleOpen:(id)sender {
    
    [self toggleOpenWithUserAction:YES];
}


-(void)toggleOpenWithUserAction:(BOOL)userAction {
    
    // Toggle the disclosure button state.
    self.DetailButton.selected = !self.DetailButton.selected;
    
    // If this was a user action, send the delegate the appropriate message.
    if (userAction) {
        if (self.DetailButton.selected) {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionOpened:)]) {
                [self.delegate sectionHeaderView:self sectionOpened:self.section];
            }
        }
        else {
            if ([self.delegate respondsToSelector:@selector(sectionHeaderView:sectionClosed:)]) {
                [self.delegate sectionHeaderView:self sectionClosed:self.section];
            }
        }
    }
}

//-(void)showaction{
//    //[_animatedview removeFromSuperview];
//  
//    [self showviewWithUserAction:YES];
//}
//
//-(void)showviewWithUserAction:(BOOL)userAction{
//        
//        // Toggle the disclosure button state.
//
//    self.disclosureButton.selected = !self.disclosureButton.selected;
//   
//    if (userAction) {
//        if (self.disclosureButton.selected) {
////            _animatedview.hidden=NO;
////            [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{ _animatedview
////                .frame =  CGRectMake(250, 5, 100, 25);} completion:nil];
//           [self.delegate sectionHeaderView:self viewopened:self.section];
////            proecsslbl.hidden=NO;
////            
////            SectionHeaderView *as=(SectionHeaderView *)[[_disclosureButton superview] superview];
////            //CGPoint rootViewPoint = [_disclosureButton.superview convertPoint:center toView:self];
////            
////            CGPoint center=as.center;
////            CGRect frame=as.frame;
////            SectionHeaderView *section = (SectionHeaderView *)[[_disclosureButton superview] superview];
////
////            [self.delegate popover:&frame :section];
//            
//            
//
//                }
//        else{
////            [UIView animateWithDuration:0.5f delay:0.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{ _animatedview
////                .frame =  CGRectMake(250, 5, 0, 25);} completion:nil];
////            [self.delegate sectionHeaderView:self viewclosed:self.section];
////              proecsslbl.hidden=YES;
//
//        }
//
//    
//}
//}



@end
