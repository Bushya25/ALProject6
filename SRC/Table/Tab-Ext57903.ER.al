// table 57903 "ExpensesRequest"
// {
//     DataClassification = ToBeClassified;
//     // Caption = 'Expenses Request';

//     fields
//     {
//         field(1; Job; Code[20])
//         {
//             DataClassification = ToBeClassified;

//         }
//         field(2; "Job Task"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(3; "Job Planning Line No."; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(4; "Line No."; Integer)
//         {
//             DataClassification = ToBeClassified;
//             // AutoIncrement = true;
//         }

//         field(21; "Type"; Enum "TypeField")
//         {
//             DataClassification = ToBeClassified;

//         }
//         field(22; "No."; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = If (Type = const("G/L Account")) "G/L Account"
//             else
//             if (Type = const(Vendor)) Vendor;
//             trigger OnValidate()
//             var
//                 GLAccountL: Record "G/L Account";
//                 VendorL: Record Vendor;
//             begin
//                 if GLAccountL.Get(Rec."No.") then
//                     Rec.Category := GLAccountL.Name
//                 else
//                     if VendorL.Get(Rec."No.") then
//                         Rec.Description := VendorL.Name;

//             end;
//         }
//         field(23; Description; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(26; Remarks; text[250])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(27; "Requested Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(29; "Requested Amount"; Integer)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             begin
//                 Rec."Remaining Amount" := Rec."Requested Amount" - Rec."Approved Amount";
//             end;
//         }
//         field(30; "Approved Amount"; Integer)
//         {
//             DataClassification = ToBeClassified;
//             trigger OnValidate()
//             var
//                 JobPlanningLineL: Record "Job Planning Line";
//                 ApprovalError: Label 'You cannot Approve beyond the Requested Amount %1 for the Record %2';
//             begin
//                 Rec."Remaining Amount" := Rec."Requested Amount" - Rec."Approved Amount";
//                 if Rec."Remaining Amount" < 0 then
//                     Error(StrSubstNo(ApprovalError, Rec."Remaining Amount", Rec.RecordId));
//             end;
//         }
//         field(31; "Remaining Amount"; Integer)
//         {
//             DataClassification = ToBeClassified;

//         }
//         field(32; "Requested By"; Code[30])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(33; "Approved Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(34; "Approved By"; Code[30])
//         {
//             DataClassification = ToBeClassified;
//         }



//         field(36; Rejected; Boolean)
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(37; Location; Code[50])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = Location;
//         }
//         field(38; Category; Text[50])
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(39; Period; Code[20])
//         {
//             Editable = false;
//             FieldClass = FlowField;
//             CalcFormula = lookup("Job Planning Line".Period where("Job No." = field(Job), "Job Task No." = field("Job Task"), "Line No." = field("Job Planning Line No.")));
//         }

//     }

//     keys
//     {
//         key(Key1; Job, "Job Task", "Job Planning Line No.", "Line No.")
//         {
//             Clustered = true;
//         }
//     }
//     trigger OnInsert()
//     var
//         JobPlanningLineL: Record "Job Planning Line";
//         ExpensesRequestL: Record "ExpensesRequest";
//         TotalCostExpenseL: Integer;
//     begin
//         TotalCostExpenseL := 0;
//         JobPlanningLineL.Reset();
//         JobPlanningLineL.SetRange("Job No.", Rec.Job);
//         JobPlanningLineL.SetRange("Job Task No.", Rec."Job Task");
//         JobPlanningLineL.SetRange("Line No.", Rec."Job Planning Line No.");
//         if JobPlanningLineL.FindFirst() then;


//         ExpensesRequestL.Reset();
//         ExpensesRequestL.SetRange(Job, Rec.Job);
//         ExpensesRequestL.SetRange("Job Task", Rec."Job Task");
//         ExpensesRequestL.SetRange("Job Planning Line No.", Rec."Job Planning Line No.");
//         ExpensesRequestL.SetRange(Rejected, false);
//         ExpensesRequestL.CalcSums(ExpensesRequestL."Requested Amount");
//         TotalCostExpenseL := ExpensesRequestL."Requested Amount";

//         TotalCostExpenseL += Rec."Requested Amount";
//         if TotalCostExpenseL > JobPlanningLineL."Allocated Budget" then
//             Error(Text001);


//         JobPlanningLineL.Validate("Total Request Amount", TotalCostExpenseL);
//         JobPlanningLineL.Modify();

//     end;

//     trigger OnModify()
//     var
//         JobPlanningLineL: Record "Job Planning Line";
//         ExpensesRequestL: Record "ExpensesRequest";
//         ExpenseMgmtL: Codeunit "ExpenseManagement";
//         TotalCostExpenseL: Integer;
//     begin
//         TotalCostExpenseL := 0;
//         JobPlanningLineL.Reset();
//         JobPlanningLineL.SetRange("Job No.", Rec.Job);
//         JobPlanningLineL.SetRange("Job Task No.", Rec."Job Task");
//         JobPlanningLineL.SetRange("Line No.", Rec."Job Planning Line No.");
//         if JobPlanningLineL.FindFirst() then;

//         ExpensesRequestL.Reset();
//         ExpensesRequestL.SetRange(Job, Rec.Job);
//         ExpensesRequestL.SetRange("Job Task", Rec."Job Task");
//         ExpensesRequestL.SetRange("Job Planning Line No.", Rec."Job Planning Line No.");
//         ExpensesRequestL.SetRange(Rejected, false);
//         ExpensesRequestL.CalcSums("Requested Amount");
//         TotalCostExpenseL := ExpensesRequestL."Requested Amount";

//         TotalCostExpenseL += Rec."Requested Amount" - xRec."Requested Amount";
//         if TotalCostExpenseL > JobPlanningLineL."Allocated Budget" then
//             Error(Text001);

//         if ExpenseMgmtL.AlreadySentForApproval(Rec) then
//             Error('Record already sent for approval');

//         JobPlanningLineL.Validate("Total Request Amount", TotalCostExpenseL);
//         JobPlanningLineL.Modify();

//     end;

//     trigger OnDelete()
//     var
//         ExpenseMgmtL: Codeunit "ExpenseManagement";
//     begin
//         if ExpenseMgmtL.AlreadySentForApproval(Rec) then
//             Error('Record already sent for approval');
//         if Rec."Approved Amount" <> 0 then
//             Error(Text002);
//     end;

//     var
//         Text001: Label 'Sum of Requested amount in Expenses Request must be equal or less than Allocated Budget in Project Planning Line';
//         Text002: Label 'This Expense Request is already Approved';
// }

// tableextension 57903 ER extends "Expenses Request"
// {
//     fields
//     {
//         field(5010; "FA No"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Fixed Asset";
//             trigger OnValidate()
//             var
//                 a: Record "Fixed Asset";
//             begin
//                 if a.Get("FA No") then begin
//                     Rec.SerialNo := a."Serial No.";
//                 end;

//             end;
//         }
//         field(5011; SerialNo; Text[20])
//         {
//             DataClassification = ToBeClassified;

//         }
//     }

//     keys
//     {
//         // Add changes to keys here
//     }

//     fieldgroups
//     {
//         // Add changes to field groups here
//     }

//     var
//         myInt: Integer;
// }
// pageextension 57903 ER extends ExpensesRequest
// {
//     layout
//     {
//         addafter("No.")
//         {
//             field("FA No"; Rec."FA No")
//             {
//                 ApplicationArea = all;
//             }
//             // field("FA Description";Rec."FA Description"){
//             //     ApplicationArea=all;
//             // }
//             field(SerialNo; Rec.SerialNo)
//             {
//                 ApplicationArea = all;
//             }
//         }
//     }

//     actions
//     {
//         // Add changes to page actions here
//     }

//     var
//         myInt: Integer;
// }