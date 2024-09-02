table 57906 ModelTable
{
    DataClassification = ToBeClassified;
    LookupPageId = ModelPage;
    fields
    {
        field(1; Code; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(21; Name; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(22; BrandCode; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = BrandTable;
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}
page 57909 ModelPage
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = ModelTable;
    InsertAllowed = true;
    DeleteAllowed = true;
    Editable = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(BrandCode; Rec.BrandCode)
                {
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