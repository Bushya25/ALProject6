// page 57910 "Expenses Request List"
// {
//     PageType = List;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     SourceTable = "Expenses Request";
//     Editable = false;

//     layout
//     {
//         area(Content)
//         {
//             repeater(GroupName)
//             {

//                 field(Job; Rec.Job)
//                 {
//                     ToolTip = 'Specifies the value of the Job field.';
//                 }
//                 field("Job Task"; Rec."Job Task")
//                 {
//                     ToolTip = 'Specifies the value of the Job Task field.';
//                 }
//                 field("Job Planning Line No."; Rec."Job Planning Line No.")
//                 {
//                     ToolTip = 'Specifies the value of the Job Planning Line No. field.';
//                 }
//                 field("Line No."; Rec."Line No.")
//                 {
//                     ToolTip = 'Specifies the value of the Line No. field.';
//                 }
//                 field("No."; Rec."No.")
//                 {
//                     ToolTip = 'Specifies the value of the No. field.';
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ToolTip = 'Specifies the value of the Description field.';
//                 }
//                 field(Remarks; Rec.Remarks)
//                 {
//                     ToolTip = 'Specifies the value of the Remarks field.';
//                 }
//                 field("Requested Amount"; Rec."Requested Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Requested Amount field.';
//                 }
//                 field("Requested By"; Rec."Requested By")
//                 {
//                     ToolTip = 'Specifies the value of the Requested By field.';
//                 }
//                 field("Requested Date"; Rec."Requested Date")
//                 {
//                     ToolTip = 'Specifies the value of the Requested Date field.';
//                 }

//                 field("Approved Amount"; Rec."Approved Amount")
//                 {
//                     ToolTip = 'Specifies the value of the Approved Amount field.';
//                 }
//                 field("Approved By"; Rec."Approved By")
//                 {
//                     ToolTip = 'Specifies the value of the Approved By field.';
//                 }
//                 field("Approved Date"; Rec."Approved Date")
//                 {
//                     ToolTip = 'Specifies the value of the Approved Date field.';
//                 }
//                 field("Remaining Amount"; Rec."Remaining Amount")
//                 {
//                     ApplicationArea = All;
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
//             action("Send for Approvals")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Send for Approvals';
//                 Image = Approvals;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedOnly = true;
//                 // trigger OnAction()
//                 // var
//                 //     ExpensesRequestL: Record "Expenses Request";
//                 //     // ExpenseMgmt: Codeunit "Expense Management";
//                 //     JobTaskL: Record "Job Task";
//                 //     EndDate: Date;
//                 //     EndDateError: Label '%1 cannot Send for Approval after the End Date(%2), Project %3 in Task No. %4';
//                 // begin
//                 //     CurrPage.SetSelectionFilter(ExpensesRequestL);

//                 //     JobTaskL.SetRange("Job No.", Rec.Job);
//                 //     JobTaskL.SetRange("Job Task No.", Rec."Job Task");
//                 //     if JobTaskL.FindFirst() then begin
//                 //         JobTaskL.CalcFields(EndDate);
//                 //         if JobTaskL.EndDate < Today then
//                 //             Error(EndDateError, UserId, JobTaskL.EndDate, JobTaskL."Job No.", JobTaskL."Job Task No.");
//                 //     end;

//                 //     ExpenseMgmt.SendForApproval(ExpensesRequestL);
//                 // end;
//             }
//         }
//     }

//     var
//         myInt: Integer;
// }