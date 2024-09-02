tableextension 57902 ER extends "Expenses Request"
{
    fields
    {
    //     modify("Unit Cost")
    //     {
    //         Caption = 'Margin Value';
    //     }
    //     modify("Total Cost")
    //     {
    //         Caption = 'Total Margin Value';
    //     }
    //     modify("Unit Price")
    //     {
    //         Caption = 'PO Value ';

    //     }
    //     modify("Line Amount")
    //     {
    //         Caption = 'Total PO Value';
    //     }


        
        field(5021;"FA No";Code[50]){
            DataClassification=ToBeClassified;
            TableRelation="Fixed Asset";
             trigger OnValidate()
             var FX:Record "Fixed Asset";
            begin
                FX.Get(Rec."FA No");
                Rec.Validate("FA Description",FX."Description");
                
            end;
        }
        field(5020;"FA Description";Text[200])
        {
            DataClassification = ToBeClassified;

        }
        field(5023;SerialNo;Text[50]){
            DataClassification = ToBeClassified;
        }

    //     field(50002; "Remaining Avaiable Budget"; Decimal)
    //     {
    //         DataClassification = ToBeClassified;
    //         Editable = false;
    //     }
    //     field(50003; "End Date"; Date)
    //     {
    //         DataClassification = ToBeClassified;
    //     }
    //     field(50004; "Total Request Amount"; Decimal)
    //     {
    //         DataClassification = ToBeClassified;
    //         Editable = false;

    //     }

    //     field(50005; "Remaining Approval Amount"; Decimal)
    //     {
    //         DataClassification = ToBeClassified;
    //         Editable = false;
    //     }
    //     field(50006; "Unit of Measure"; Option)
    //     {
    //         OptionMembers = ,Each,"No.",Meters,Kms;
    //         Caption = 'Unit of Measure';
    //         OptionCaption = ',Each,No.,Meters,Kms';
    //     }
    //     field(50007; "Service No."; Code[30])
    //     {
    //         DataClassification = ToBeClassified;
    //     }
    //     field(50008; Period; Code[20])
    //     {
    //         DataClassification = ToBeClassified;
    //     }
       
    
}}
    // trigger OnInsert()
    // var
    //     JobL: Record Job;
    // begin
    //     if Rec."Allocated Budget" > Rec."Total Cost" then
    //         Error(Text1);
    //     AfterApprovalInJobPlanLine(Rec);
    //     JobL.Reset();
    //     JobL.SetRange("No.", Rec."Job No.");
    //     JobL.SetRange(Queried, True);
    //     if JobL.FindFirst() then
    //         Error('This Project is in Queried State');
    // end;

    // trigger OnModify()
    // var
    //     JobL: Record Job;
    // begin
    //     if Rec."Allocated Budget" > Rec."Total Cost" then
    //         Error(Text1);
    //     JobL.SetRange("No.", Rec."Job No.");
    //     JobL.SetRange(Queried, True);
    //     if JobL.FindFirst() then
    //         Error('This Project is in Queried State');
    // end;

    // trigger OnDelete()
    // begin
    //     AfterApprovalInJobPlanLine(Rec);
    // end;

    // local procedure AfterApprovalInJobPlanLine(var JobPlanningLineP: Record "Job Planning Line")
    // var
    //     JobL: Record Job;
    // begin
    //     JobL.Get(JobPlanningLineP."Job No.");
    //     JobL.AfterApprovalNoEditinginJob()
    // end;

    // var
    //     Text1: Label 'Allocated Budget must be less than Total Delivery Cost';
// }