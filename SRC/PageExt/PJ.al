pageextension 57910 "Approve Payment" extends "Payment Journal"
{
    layout
    {
 
    }
 
    actions
    {
        addafter(Reject)
        {
            action("Approve Only")
            {
                ApplicationArea = All;
                Caption = 'Approve Only';
                Promoted = true;
                PromotedCategory = Process;
                Image = Approve;
                Scope = Repeater;
                ToolTip = 'Approve the selected journal lines and move to the next workflow group.';
 
                trigger OnAction()
                var
                    ApprovalEntry: Record "Approval Entry";
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    PaymentJournalLine: Record "Gen. Journal Line";
                    WorkflowUserGroup: Record "Workflow User Group";
                    PayJL2: Record "Gen. Journal Line";
                    er: page ExpensesRequest;
                    gb:record "Gen. Journal Batch";
                begin
 
                    CurrPage.SetSelectionFilter(PaymentJournalLine);
 
                    if PaymentJournalLine.FindSet() then begin
                        repeat
 
                            //         // Process each selected journal line
                            ApprovalEntry.SetRange("Table ID", DATABASE::"Gen. Journal Line");
                            ApprovalEntry.SetRange("Record ID to Approve", PaymentJournalLine.RecordId);
                            // PaymentJournalLine.SetRange("Journal Template Name", PayJL2."Journal Template Name");
                            // PaymentJournalLine.SetRange("Journal Batch Name", PayJL2."Journal Batch Name");
                            // PaymentJournalLine.SetRange("Line No.", PayJL2."Line No.");
 
 
                            if ApprovalEntry.FindSet() then begin

 
                                CurrPage.SetSelectionFilter(ApprovalEntry);
                                ApprovalsMgmt.ApproveApprovalRequests(ApprovalEntry);
 
                                PaymentJournalLine."Pending Approval" := true;
                                PaymentJournalLine.Modify();
                                Message('Selected journal lines have been approved and moved to the next workflow group.');
                            end;
                        until PaymentJournalLine.Next() = 0;
 
                    end;
 
 
                end;
            }
            action("Post Only")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Post Only';
                Image = PostOrder;
                ToolTip = 'Finalize the document or journal by posting the amounts and quantities to the related accounts in your books.';
 
                trigger OnAction()
                var
                    GenJournalLine: Record "Gen. Journal Line";
                    FixedAsset: Record "Fixed Asset";
                    FAJournalLine: Record SubTable;
                    ER: record "Expenses Request";
                    jobl: record job;
                    LineNo: Integer;
                    SavingsAccount: Record "G/L Account";
                    GenJL2: Record "Gen. Journal Line";
                begin
                    CurrPage.SetSelectionFilter(GenJL2);
                    GenJournalLine.SetRange("Journal Template Name", GenJL2."Journal Template Name");
                    GenJournalLine.SetRange("Journal Batch Name", GenJL2."Journal Batch Name");
                    GenJournalLine.SetRange("Line No.", GenJL2."Line No.");
 
                    if GenJournalLine.FindSet() then
                        repeat
                            if GenJournalLine."Journal Template Name" <> '' then begin
                                ER.Get(GenJournalLine."Expense Record ID");
 
                                if ER."Job" <> '' then begin
                                    if FixedAsset.Get(ER."FA No") then begin
 
                                        FAJournalLine.SetRange("Line No.",ER."Line No.");
                                        if FAJournalLine.FindLast() then
                                            LineNo := FAJournalLine."Line No." + 10000
                                        else
                                            LineNo := 10000;
                                        FAJournalLine.Init();
                                        FAJournalLine.Validate("Fixed Assest No",ER."FA No");
                                        FAJournalLine.validate("Line No.", LineNo);
                                        FAJournalLine.Validate(Period, Today);
                                        jobl.get(ER.Job);
                                        FAJournalLine.Validate("Client Name", jobl."Sell-to Customer Name");
                                        FAJournalLine.Validate(Remarks, ER.Remarks);
                                        FAJournalLine.Validate(Cost, GenJournalLine.Amount); // Validate approved amount from Gen. Journal Line
                                        FAJournalLine.Insert();
 
                                        ER.Validate("Approved Amount", GenJournalLine.Amount); // Validate approved amount from Gen. Journal Line
                                        ER.Modify();
 
                                        SavingsAccount.Get(GenJournalLine."Account No.");
                                        SavingsAccount."Balance" := 0;
                                        SavingsAccount.Modify();
                                    end;
                                end;
                                GenJournalLine.Delete();
 
                            end;
                        until GenJournalLine.Next() = 0;
                    Message('Posting completed successfully');
                end;
            }
        }
    }
    var
        s: Page "Requests to Approve";
 
 
}