// page 57909 ExpenseRequest
// {
//     PageType = ListPart;
//     ApplicationArea = All;
//     SourceTable = "ExpensesRequest";
//     Caption = 'Expenses Request';
//     AutoSplitKey = true;
//     MultipleNewLines = true;
//     DelayedInsert = true;
//     LinksAllowed = true;


//     layout
//     {
//         area(Content)
//         {
//             repeater(Control1)
//             {
//                 ShowCaption = false;
//                 field(Job; Rec.Job)
//                 {
//                     ToolTip = 'Specifies the value of the Job field.';
//                     ApplicationArea = All;
//                     Visible = false;
//                     Editable = false;
//                 }
//                 field("Job Task"; Rec."Job Task")
//                 {
//                     ToolTip = 'Specifies the value of the Job Task field.';
//                     ApplicationArea = All;
//                     Visible = false;
//                     Editable = false;
//                 }
//                 field("Job Planning Line No."; Rec."Job Planning Line No.")
//                 {
//                     ToolTip = 'Specifies the value of the Job Planning Line No. field.';
//                     ApplicationArea = All;
//                     Visible = false;
//                     Editable = false;
//                 }
//                 field("Line No."; Rec."Line No.")
//                 {
//                     ToolTip = 'Specifies the value of the Line No. field.';
//                     ApplicationArea = All;
//                     Visible = false;
//                     Editable = false;

//                 }
//                 field(Period; Rec.Period)
//                 {
//                     ApplicationArea = All;
//                 }
//                 field("Type"; Rec."Type")
//                 {
//                     ToolTip = 'Specifies the value of the Type field.';
//                     ApplicationArea = All;
//                     Editable = Rec."Approved Amount" = 0;
//                     trigger OnValidate()
//                     begin

//                         Rec.Location := '';
//                         Rec."No." := '';
//                         Rec.Category := '';
//                         Rec.Description := '';
//                         Rec.Remarks := '';
//                         Rec."Requested Amount" := 0;
//                         Rec."Requested By" := '';
//                         Rec."Requested Date" := 0D;
//                         Rec."Remaining Amount" := 0;
//                     end;
//                 }

//                 field(Location; Rec.Location)
//                 {
//                     ApplicationArea = All;
//                     Editable = Rec."Approved Amount" = 0;
//                 }

//                 field("No."; Rec."No.")
//                 {
//                     ToolTip = 'Specifies the value of the No. field.';
//                     ApplicationArea = All;
//                     Editable = Rec."Approved Amount" = 0;
//                 }
//                 field(Category; Rec.Category)
//                 {
//                     ToolTip = 'Specifies the value of the Description field.';
//                     ApplicationArea = All;
//                     Editable = Rec."Approved Amount" = 0;
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ApplicationArea = All;
//                     Editable = Rec."Approved Amount" = 0;
//                 }


//                 field(Remarks; Rec.Remarks)
//                 {
//                     ToolTip = 'Specifies the value of the Remarks field.';
//                     ApplicationArea = All;
//                     Editable = Rec."Approved Amount" = 0;
//                 }

//                 field("Requested Amount"; Rec."Requested Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Requested Amount field.';
//                     ApplicationArea = All;
//                     Editable = Rec."Approved Amount" = 0;
//                 }
//                 field("Requested By"; Rec."Requested By")
//                 {
//                     ToolTip = 'Specifies the value of the Requested By field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Requested Date"; Rec."Requested Date")
//                 {
//                     ToolTip = 'Specifies the value of the Requested Date field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Approved Amount"; Rec."Approved Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Approved Amount field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }

//                 field("Approved By"; Rec."Approved By")
//                 {
//                     ToolTip = 'Specifies the value of the Approved By field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field("Approved Date"; Rec."Approved Date")
//                 {
//                     ToolTip = 'Specifies the value of the Approved Date field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }

//                 field("Remaining Amount"; Rec."Remaining Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Remaining Amount field.';
//                     ApplicationArea = All;
//                     Editable = false;
//                 }
//                 field(Rejected; Rec.Rejected)
//                 {
//                     ApplicationArea = All;
//                 }
//             }
//         }


//     }
//     actions
//     {
//         area(Processing)
//         {
//             action(ExpensesRequestPage)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Expenses Request Page';
//                 Image = ListPage;
//                 RunObject = page "Expenses Request List";
//             }
//             action("Send for Approvals")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Send for Approvals';
//                 Image = Approvals;
//                 trigger OnAction()
//                 var
//                     ExpensesRequestL: Record "Gen. Journal Line";
//                     ExpenseMgmt: page Subpage;
//                     JobTaskL: Record "Job Task";
//                     EndDate: Date;
//                     EndDateError: Label '%1 cannot Send for Approval after the End Date(%2), Project %3 in Task No. %4';
//                 begin
//                     CurrPage.SetSelectionFilter(ExpensesRequestL);

//                     JobTaskL.SetRange("Job No.", Rec.Job);
//                     JobTaskL.SetRange("Job Task No.", Rec."Job Task");
//                     if JobTaskL.FindFirst() then begin
//                         JobTaskL.CalcFields("End Date");
//                         if JobTaskL."End Date" < Today then
//                             Error(EndDateError, UserId, JobTaskL."End Date", JobTaskL."Job No.", JobTaskL."Job Task No.");
//                     end;

//                     ExpenseMgmt.SetControlAppearance(ExpensesRequestL);
//                 end;
//             }
//         }
//     }
//     trigger OnInsertRecord(BelowxRec: Boolean): Boolean
//     begin
//         Rec."Requested By" := UserId;
//         Rec."Requested Date" := Today;
//     end;

//     trigger OnModifyRecord(): Boolean
//     begin
//         Rec."Requested By" := UserId;
//         Rec."Requested Date" := Today;

//     end;
// }


// pageextension 57903 JObPLine extends "Job Planning Lines"
// {
//     layout
//     {
//         addafter(Control1)
//         {
//             part(ExpenseRequest; ExpenseRequest)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Expense Request';
//                 SubPageLink = Job = field("Job No.");
//                 UpdatePropagation = Both;
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