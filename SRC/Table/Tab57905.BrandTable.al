table 57905 "BrandTable"
{
    DataClassification = ToBeClassified;
    LookupPageId=BrandPage;
    
    fields
    {
        field(1;Code;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(21;Name;Text[50]){
            DataClassification = ToBeClassified;
        }
        field(22;Type;Option){
            DataClassification=ToBeClassified;
            OptionMembers="","TX5","Single","Ribbon","1330/1550";
        }
        field(23;Supplier;Option){
            DataClassification=ToBeClassified;
            OptionMembers="","KEITH","TREAD","CANLITEK","to Checj","TO TRACK";
        }
    }
    
    keys
    {
        key(Key1;Code)
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    }
    
    var
        myInt: Page "Sales Quote";
    
}
page 57912 BrandPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = BrandTable;
    InsertAllowed=true;
    DeleteAllowed=true;
    Editable=true;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code;Rec.Code)
                {
                    ApplicationArea = All;
                    
                }
                field(Name;Rec.Name){
                    ApplicationArea = All;
                }
                field(Type;Rec.Type){
                    ApplicationArea = All;
                }
                field(Supplier;Rec.Supplier){
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