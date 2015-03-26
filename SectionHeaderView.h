
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ProductViewController;
@protocol SectionHeaderViewDelegate;

@interface SectionHeaderView : UIView {
    UILabel *proecsslbl;
}
@property (nonatomic, weak) UILabel *proecsslbl;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, strong)UIView *animatedview;
@property (nonatomic, weak) UIButton *disclosureButton;
@property (nonatomic, weak) UIButton *DetailButton;
@property (nonatomic, assign) NSInteger section;
@property (nonatomic, weak) id <SectionHeaderViewDelegate> delegate;
@property (nonatomic, retain) IBOutlet ProductViewController *hrVCrl;

-(id)initWithFrame:(CGRect)frame title:(NSString*)title section:(NSInteger)sectionNumber delegate:(id <SectionHeaderViewDelegate>)delegate;
-(void)toggleOpenWithUserAction:(BOOL)userAction;
-(void)showviewWithUserAction:(BOOL)userAction;

@end

/*
 Protocol to be adopted by the section header's delegate; the section header tells its delegate when the section should be opened and closed.
 */
@protocol SectionHeaderViewDelegate <NSObject>

@optional
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionOpened:(NSInteger)section;
-(void)sectionHeaderView:(SectionHeaderView*)sectionHeaderView sectionClosed:(NSInteger)section;
+(void)showhidepopoverview:(SectionHeaderView*)sectionHeaderView popoveropened:(NSInteger)section;
-(void)hideview:(NSString *)s;
-(void)sectionHeaderView:(SectionHeaderView *)sectionHeaderView viewopened:(NSInteger)section;
-(void)sectionHeaderView:(SectionHeaderView *)sectionHeaderView viewclosed:(NSInteger)section;
@end

