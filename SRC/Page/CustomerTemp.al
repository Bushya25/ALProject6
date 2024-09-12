page 57910 CustomerPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable =Customer;
    SourceTableTemporary=true;
    
    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No.";Rec."No.")
                {
                    ApplicationArea = All;
                    
                }
                field(Name;Rec.Name){
                    ApplicationArea = All;
                }
                field(Address;Rec.Address){
                    ApplicationArea = All;
                }
                field("Phone No.";Rec."Phone No."){
                    ApplicationArea = All;
                }
                field("E-Mail";Rec."E-Mail"){
                    ApplicationArea=all;
                }
                field(Balance;Rec.Balance){
                    ApplicationArea = All;
                }
                field(Contact;Rec.Contact){
                    ApplicationArea=all;
                }
                field("Sales (LCY)";Rec."Sales (LCY)"){
                    ApplicationArea = All;
                }
                field(Payments;Rec.Payments){
                    ApplicationArea = All;
                }
            }
        }
    }
    
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;
                
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
    
    var
        myInt: Integer;
}