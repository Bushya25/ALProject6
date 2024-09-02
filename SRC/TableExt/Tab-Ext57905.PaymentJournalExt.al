tableextension 57905 PaymentJournalExt extends "Gen. Journal Line"
{
    // fields
    // {
    //     field(50001;"PO NO.";Code[10]){
    //         Caption = 'PO NO.';
    //         DataClassification=ToBeClassified;
    //     }
    //     field(50005;"Expense Record Id";code[20]){
    //         DataClassification=ToBeClassified;
    //     }
    //     field(50003;Remarks;Text[200]){
    //         DataClassification=ToBeClassified;
    //     }
    //     field(50004;Rejected;Boolean){
    //         Caption = 'Rejected';
    //         DataClassification=ToBeClassified;
    //     }
    // }

}
// pageextension 57905 PaymentJournalpage extends "Payment Journal" 
// {
//     layout
//     {
//        addafter("Document No."){
//         field("PO NO.";Rec."PO NO."){
//             Caption = 'PO NO.';
//             ApplicationArea = All;
//         }
//        }
//        addafter(Description){
//         field("Expense Record Id";Rec."Expense Record Id"){

//             ApplicationArea = All;
//            Editable=false;
//             trigger OnDrillDown()
//                 var
//                     ExpenseRequestL: Record "Expenses Request";
//                 begin
//                     ExpenseRequestL.Get(Rec."Expense Record ID");
//                     page.Run(57907, ExpenseRequestL);
//                 end;

//         }
//         field(Remarks;Rec.Remarks){
//             Caption = 'Remarks';
//             ApplicationArea = All;
//         }
//         field(Rejected;Rec.Rejected){
//             ApplicationArea=all;
//         }
//        }
//     }

//     actions
//     {
//         // Add changes to page actions here
//     }

//     var
//         myInt: Integer;
// }
pageextension 57905 PJ extends "Payment Journal"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {

    }

    var
    a:page 8894;
        myInt: Codeunit "Gen. Jnl.-Post Line";
}
codeunit 57903 PostEvent
{

    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Gen. Jnl.-Post Line", 'OnBeforePostGenJnlLine', '', false, false)]
    local procedure OnBeforePostGenJnlLine(var GenJournalLine: Record "Gen. Journal Line"; Balancing: Boolean)
    var
        FAsub: Record SubTable;
        ER: Record "Expenses Request";
        lineno: Integer;
    begin
      if  ER.Get(GenJournalLine."Expense Record ID") then
      begin

        if ER."FA No" <> '' then begin
            FAsub.SetRange("Fixed Assest No", ER."FA No");
            if FASub.FindLast() then
                LineNo := FASub."Line No." + 10000
            else
                LineNo := 10000;
            FASub.Init();
            FAsub.Validate("Line No.", lineno);
            FAsub.Validate("Fixed Assest No", ER."FA No");
            FASub.Validate(Period, Today);
            FAsub.Validate(Cost,ER."Requested Amount");
            // FAsub.Validate(Description,ER."FA Description");
            FASub.Insert(true);
            Message('Successful');
        end;
      end;
    end;
}
enumextension 57900  EmailScenario extends  "Email Scenario"
{
    value(5010;Twitter){

    }
    
}
