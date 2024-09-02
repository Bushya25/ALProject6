page 57906 ExpenseDetails
{
    PageType = ListPart;
    ApplicationArea = All;
    SourceTable = SubTable;
    // InsertAllowed = true;
    // DeleteAllowed = true;
    AutoSplitKey = true;
    // LinksAllowed = true;
    SaveValues = true;
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                    Visible = false;
                }
                field("Vehicle Number"; Rec."Vehicle Number")
                {
                    ToolTip = 'Specifies the value of the Vehicle Number field.', Comment = '%';
                    Visible = false;
                }
                field(Period; Rec.Period)
                {
                    ToolTip = 'Specifies the value of the Period field.', Comment = '%';
                }
                // field(Model; Rec.Model)
                // {
                //     ToolTip = 'Specifies the value of the Model field.', Comment = '%';
                // }
                field("Project Type"; Rec."Project Type")
                {
                    ToolTip = 'Specifies the value of the Project Type field.', Comment = '%';
                }
                field("Client No."; Rec."Client No.")
                {
                    ToolTip = 'Specifies the value of the Client No. field.', Comment = '%';

                    trigger OnValidate()
                    var ER: Record "Expenses Request";
                    begin
                        if Rec.Get(Rec."Client No.")then
                        begin
                            // Rec.Validate(Description,ER."FA Description");
                            Rec.Validate(Period,Today);
                            Rec.Validate(Cost,ER."Approved Amount");
                        end;
                    end;
                }
                field("Client Name"; Rec."Client Name")
                {
                    ToolTip = 'Specifies the value of the Client Name field.', Comment = '%';
                }
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Category; Rec.Category)
                {
                    ToolTip = 'Specifies the value of the Category field.', Comment = '%';
                }
                field(Remarks; Rec.Remarks)
                {
                    ToolTip = 'Specifies the value of the Remarks field.', Comment = '%';
                }
                field(Description;Rec.Description){
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Cost; Rec.Cost)
                {
                    ToolTip = 'Specifies the value of the Cost field.', Comment = '%';
                }
                // field("Total Cost"; Rec."Total Cost")
                // {
                //     ToolTip = 'Specifies the value of the Total Cost field.', Comment = '%';
                // }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ToolTip = 'Specifies the value of the Payment Type field.', Comment = '%';
                }
                field("Account Holder Name"; Rec."Account Holder Name")
                {
                    ToolTip = 'Specifies the value of the Account Holder Name field.', Comment = '%';
                }
                field("Account No/Mobile No"; Rec."Account No/Mobile No")
                {
                    ToolTip = 'Specifies the value of the Account No/Mobile No field.', Comment = '%';
                }
                field("IFSC Code"; Rec."IFSC Code")
                {
                    ToolTip = 'Specifies the value of the IFSC Code field.', Comment = '%';
                }
                field(ApprovedAmount; Rec.ApprovedAmount)
                {
                    ToolTip = 'Specifies the value of the Approved Amount field.', Comment = '%';
                }
            }
        }
    }

//     actions
//     {
//         area(processing)
//         {
//             action("Sent for Approval")
//             {
//                 Caption = 'Sent for Approval';
//                 Visible=false;

//                 ApplicationArea = All;

//                 Image = SendApprovalRequest;
//                 trigger OnAction()
//                 var
//                     FixedAssetHeader: Record "Fixed Asset";
//                     FixedAssetSub: Record SubTable;
//                     GenJournalL: Record "Gen. Journal Line";
//                     GenLS: Record "General Ledger Setup";
//                     FAsetUp: Record "FA Setup";
//                     NoSeries: Codeunit "No. Series";
//                     DocNo: Code[10];
//                     lineno: Integer;
//                     TotalAmount: Decimal;
//                     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//                     paymentJournal: page "Payment Journal";
//                     Genjournal2l: Record "Gen. Journal Line";
//                     ER:Record "Expenses Request";

//                 begin
//                     CurrPage.SetSelectionFilter(FixedAssetSub);
//                     GenLS.Get();
//                     FAsetUp.Get();
//                     GenLS.TestField("Payment Journal Bank");
//                     GenLS.TestField("Payment Journal Batch");
//                     GenLS.TestField("Payment Journal Template");
//                     GenJournalL.SetRange("Journal Template Name", GenLS."Payment Journal Template");
//                     GenJournalL.SetRange("Journal Batch Name", GenLS."Payment Journal Batch");
//                     if GenJournalL.FindLast() then
//                         lineno := GenJournalL."Line No." + 10000
//                     else
//                         lineno := 10000;

//                     // DocNo := NoSeries.GetNextNo(FAsetUp."Document No.", Today);
//                     // FixedAssetsub.SetRange(FixedAssetSub."Line No.");
//                     if FixedAssetSub.Findset() then begin
//                         FixedAssetHeader.Get(FixedAssetSub."Fixed Assest No");

//                         repeat



//                             GenJournalL.Init();
//                             GenJournalL.SetRange("Line No.", GenJournalL."Line No.");
//                             GenJournalL.Validate("Journal Template Name", GenLS."Payment Journal Template");
//                             GenJournalL.Validate("Journal Batch Name", GenLS."Payment Journal Batch");
//                             GenJournalL.Validate("Account Type", GenJournalL."Account Type"::"G/L Account");
//                             // GenJournalL.Validate("PO No.", 'Veh-' + FixedAssetHeader."Registration No");
//                             GenJournalL.Validate("Line No.", lineno);
//                             GenJournalL.Insert(true);
//                             GenJournalL."Posting Date" := Today;
//                             // GenJournalL.validate("Expense Record Id", FixedAssetSub.);
//                             GenJournalL.validate(Description, FixedAssetSub.Category);
//                             GenJournalL.Validate("Account No.", FixedAssetSub."No");
//                             GenJournalL.Validate("Document Type", GenJournalL."Document Type"::Payment);
//                             GenJournalL.Validate("Remarks", FixedAssetSub.Remarks);
//                             GenJournalL.Validate("Document No.", DocNo);
//                             GenJournalL.Validate(Amount, FixedAssetSub.Cost);

//                             GenJournalL.Modify(true);


//                             lineno += 10000;
//                             TotalAmount += GenJournalL.Amount;
//                         until FixedAssetSub.Next() = 0;
//                     end;

//                     GenJournalL.Init();
//                     GenJournalL.SetRange("Line No.", GenJournalL."Line No.");
//                     GenJournalL.Validate("Journal Template Name", GenLS."Payment Journal Template");
//                     GenJournalL.Validate("Journal Batch Name", GenLS."Payment Journal Batch");
//                     GenJournalL.Validate("Account Type", GenJournalL."Account Type"::"Bank Account");
//                     GenJournalL.Validate("Line No.", lineno);
//                     GenJournalL.Insert(true);
//                     GenJournalL."Posting Date" := Today;
//                     GenJournalL.Validate(Description, 'Total Amount');
//                     GenJournalL.Validate("Document Type", GenJournalL."Document Type"::Payment);
//                     GenJournalL.Validate("Document No.", DocNo);
//                     GenJournalL.Validate("Account No.", GenLS."Payment Journal Bank");
//                     GenJournalL.Validate(Amount, -TotalAmount);
//                     GenJournalL.Modify(true);

//                     message('Approval sent');
//                     GenJournal2l.Reset();
//                     Genjournal2l.SetRange("Document No.", DocNo);
//                     if Genjournal2l.FindSet() then begin
//                         ApprovalsMgmt.TrySendJournalBatchApprovalRequest(GenJournal2l);
//                         SetControlAppearanceFromBatch(GenJournal2l);
//                         SetControlAppearance(GenJournal2l);
//                         Message('Success');
//                     end;
//                 end;

//             }
//         }
//     }
    
//     var a: page "Requests to Approve";
//     b:page ExpensesRequest;
//     // procedure SetControlAppearance(genjournalL: Record "Gen. Journal Line")
//     // var
//     //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//     //     WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
//     //     // CanRequestFowApprovalForLine: Boolean;

//     // begin
//     //     OpenApprovalEntriesExistForCurrUser :=
//     //         OpenApprovalEntriesExistForCurrUserBatch or ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);

//     //     OpenApprovalEntriesOnJnlLineExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
//     //     OpenApprovalEntriesOnBatchOrCurrJnlLineExist := OpenApprovalEntriesOnJnlBatchExist or OpenApprovalEntriesOnJnlLineExist;

//     //     CanCancelApprovalForJnlLine := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);

//     //     WorkflowWebhookManagement.GetCanRequestAndCanCancel(Rec.RecordId, CanRequestFlowApprovalForLine, CanCancelFlowApprovalForLine);
//     //     CanRequestFlowApprovalForBatchAndCurrentLine := CanRequestFlowApprovalForBatch and CanRequestFlowApprovalForLine;
//     // end;

//     // local procedure CheckOpenApprovalEntries(BatchRecordId: RecordID; GenJournalL: Record "Gen. Journal Line")
//     // var
//     //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";

//     // begin
//     //     OpenApprovalEntriesExistForCurrUserBatch := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(BatchRecordId);

//     //     OpenApprovalEntriesOnJnlBatchExist := ApprovalsMgmt.HasOpenApprovalEntries(BatchRecordId);

//     //     OpenApprovalEntriesOnBatchOrAnyJnlLineExist :=
//     //       OpenApprovalEntriesOnJnlBatchExist or
//     //       ApprovalsMgmt.HasAnyOpenJournalLineApprovalEntries(GenJournalL."Journal Template Name", GenJournalL."Journal Batch Name");
//     // end;

//     // procedure SetControlAppearanceFromBatch(genjournal: Record "Gen. Journal Line")
//     // begin
//     //     SetApprovalStateForBatch(genjournal);
//     //     BackgroundErrorCheck := BackgroundErrorHandlingMgt.BackgroundValidationFeatureEnabled();
//     //     ShowAllLinesEnabled := true;
//     //     genjournal.SwitchLinesWithErrorsFilter(ShowAllLinesEnabled);
//     //     JournalErrorsMgt.SetFullBatchCheck(true);
//     // end;

//     // internal procedure SetApprovalStateForBatch(genjournal: Record "Gen. Journal Line")
//     // var
//     //     GenJournalBatch: Record "Gen. Journal Batch";
//     //     ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//     //     WorkflowWebhookManagement: Codeunit "Workflow Webhook Management";
//     //     WorkflowManagement: Codeunit "Workflow Management";
//     //     WorkflowEventHandling: Codeunit "Workflow Event Handling";
//     //     CanRequestFlowApprovalForAllLines: Boolean;
//     // begin
//     //     if ClientTypeManagement.GetCurrentClientType() = CLIENTTYPE::ODataV4 then
//     //         exit;
//     //     CurrentJnltemplateName := genjournal."Journal Template Name";
//     //     CurrentJnlBatchName := genjournal."Journal Batch Name";
//     //     if not GenJournalBatch.Get(CurrentJnltemplateName, CurrentJnlBatchName) then
//     //         exit;

//     //     CheckOpenApprovalEntries(GenJournalBatch.RecordId, genjournal);

//     //     CanCancelApprovalForJnlBatch := ApprovalsMgmt.CanCancelApprovalForRecord(GenJournalBatch.RecordId);

//     //     WorkflowWebhookManagement.GetCanRequestAndCanCancelJournalBatch(
//     //       GenJournalBatch, CanRequestFlowApprovalForBatch, CanCancelFlowApprovalForBatch, CanRequestFlowApprovalForAllLines);
//     //     CanRequestFlowApprovalForBatchAndAllLines := CanRequestFlowApprovalForBatch and CanRequestFlowApprovalForAllLines;
//     //     ApprovalEntriesExistSentByCurrentUser := ApprovalsMgmt.HasApprovalEntriesSentByCurrentUser(GenJournalBatch.RecordId) or ApprovalsMgmt.HasApprovalEntriesSentByCurrentUser(Rec.RecordId);

//     //     EnabledGenJnlLineWorkflowsExist := WorkflowManagement.EnabledWorkflowExist(DATABASE::"Gen. Journal Line", WorkflowEventHandling.RunWorkflowOnSendGeneralJournalLineForApprovalCode());
//     //     EnabledGenJnlBatchWorkflowsExist := WorkflowManagement.EnabledWorkflowExist(DATABASE::"Gen. Journal Batch", WorkflowEventHandling.RunWorkflowOnSendGeneralJournalBatchForApprovalCode());

//     // end;


//     // var

//     //     OpenApprovalEntriesExistForCurrUser: Boolean;
//     //     CurrentJnltemplateName: Code[10];
//     //     OpenApprovalEntriesExistForCurrUserBatch: Boolean;
//     //     CanRequestFlowApprovalForBatchAndAllLines: Boolean;
//     //     BackgroundErrorCheck: Boolean;
//     //     ShowAllLinesEnabled: Boolean;
//     //     ApprovalEntriesExistSentByCurrentUser: Boolean;
//     //     EnabledGenJnlLineWorkflowsExist: Boolean;
//     //     OpenApprovalEntriesOnJnlBatchExist: Boolean;
//     //     EnabledGenJnlBatchWorkflowsExist: Boolean;
//     //     CanCancelApprovalForJnlBatch: Boolean;
//     //     CanCancelFlowApprovalForBatch: Boolean;
//     //     OpenApprovalEntriesOnJnlLineExist: Boolean;
//     //     OpenApprovalEntriesOnBatchOrCurrJnlLineExist: Boolean;
//     //     OpenApprovalEntriesOnBatchOrAnyJnlLineExist: Boolean;
//     //     CanCancelApprovalForJnlLine: Boolean;
//     //     CanRequestFlowApprovalForBatchAndCurrentLine: Boolean;
//     //     CanRequestFlowApprovalForBatch: Boolean;
//     //     CanCancelFlowApprovalForLine: Boolean;
//     //     ClientTypeManagement: Codeunit "Client Type Management";
//     //     CurrentJnlBatchName: Code[10];
//     //     JournalErrorsMgt: Codeunit "Journal Errors Mgt.";
//     //     BackgroundErrorHandlingMgt: Codeunit "Background Error Handling Mgt.";



 }