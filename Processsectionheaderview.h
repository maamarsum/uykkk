//
//  Processsectionheaderview.h
//  Newproject
//
//  Created by GMSIndia1 on 2/10/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ProcesssectionheaderviewDelegate;
@interface Processsectionheaderview : UIView{




    //UILabel *proecsslbl;
}
@property (nonatomic, strong) UILabel *proecsslbl;
@property (nonatomic, strong) UILabel *proecsslbl2;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, strong) UIView *animatedview;
@property (nonatomic, strong) UIView *animatedview2;
@property (nonatomic, weak) UIButton *disclosureButton;
@property (nonatomic, weak) UIButton *DetailButton;
@property (nonatomic, assign) NSInteger section;
@property (nonatomic, weak) id <ProcesssectionheaderviewDelegate> delegate;
//@property (nonatomic, retain) IBOutlet HRViewController *hrVCrl;

-(id)initWithFrame:(CGRect)frame title:(NSString*)title section:(NSInteger)sectionNumber delegate:(id <ProcesssectionheaderviewDelegate>)delegate;
-(void)toggleOpenWithUserAction:(BOOL)userAction;
-(void)showviewWithUserAction:(BOOL)userAction;

@end



/*
 Protocol to be adopted by the section header's delegate; the section header tells its delegate when the section should be opened and closed.
 */
@protocol ProcesssectionheaderviewDelegate <NSObject>

@optional
-(void)sectionHeaderView:(Processsectionheaderview*)sectionHeaderView sectionOpened:(NSInteger)section;
-(void)sectionHeaderView:(Processsectionheaderview*)sectionHeaderView sectionClosed:(NSInteger)section;
+(void)showhidepopoverview:(Processsectionheaderview*)sectionHeaderView popoveropened:(NSInteger)section;
-(void)navigatetoVctrl:(NSInteger )s;
-(void)Jobview:(NSString *)nwstrg;
-(void)senttojob:(NSString *)nwstrg;

-(void)sectionHeaderView:(Processsectionheaderview *)sectionHeaderView viewopened:(NSInteger)section;
-(void)sectionHeaderView:(Processsectionheaderview*)sectionHeaderView viewclosed:(NSInteger)section;



@end
