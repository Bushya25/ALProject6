pageextension 57911 "PaymentJournalExt" extends "Payment Journal"

{

    actions
    {
        addafter(Reject)
        {
            action("RevokeApproval")

            {

                Caption = 'Revoke Approval';
                ApplicationArea = All;
                Image = Reopen;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ShortCutKey = 'Ctrl+Shift+R';
                trigger OnAction()
                var
                    GenJournalLine: Record "Gen. Journal Line";
                    ApprovalEntry: Record "Approval Entry";
                    SelectedLines: Integer;
                begin
                    SelectedLines := 0;
                    if GenJournalLine.FindSet() then begin
                        repeat
                            if GenJournalLine."Pending Approval" = false then begin
                                GenJournalLine."Pending Approval" := true;
                                GenJournalLine.Modify(true);
                                ApprovalEntry.Init();
                                ApprovalEntry."Entry No." := ApprovalEntry."Entry No." + 1;
                                ApprovalEntry."Record ID to Approve" := GenJournalLine."Expense Record ID";
                                ApprovalEntry."Approver ID" := UserId;
                                ApprovalEntry."Last Date-Time Modified" := CurrentDateTime;
                                ApprovalEntry.Insert();
                                SelectedLines += 1;
                            end;
                        until GenJournalLine.Next() = 0;
                    end;
                    if SelectedLines = 0 then
                        Message('No approved lines were selected for revoking.')
                    else
                        Message('%1 lines were successfully revoked.', SelectedLines);
                end;
                
            }         
        }
    }
}

