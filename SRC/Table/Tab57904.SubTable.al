table 57904 SubTable
{
    DataClassification = ToBeClassified;
     LookupPageId =ExpenseDetails;
    DrillDownPageId =ExpenseDetails;

 
    fields
    {
        field(1; "Line No."; Integer)
        {
            DataClassification = ToBeClassified;

 
        }
        field(21; "Vehicle Number"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(22; Period; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(23; Model; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Project Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers="","O&M","Project";

        }
        field(25; "Client No."; Text[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
            trigger OnValidate()
            var
                CustL: Record Customer;
            begin
                if CustL.Get("Client No.") then begin
                    Rec."Client Name" := CustL.Name;
                end;
 
            end;
        }
        field(35; "Client Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable= false;
        }
        field(26; Remarks; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(27; Cost; Decimal)
        {
            DataClassification = ToBeClassified;
        }
                field(29; "Payment Type"; option)
        {
            OptionMembers = " ","Cash","NEFT",UPI,RTGS;
        }
        field(30; "Account Holder Name"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Account No/Mobile No"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(32; "IFSC Code"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(33; Category; Text[50])
        {
            DataClassification = ToBeClassified;
            
        }
        field(34; Name; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(36;"Fixed Assest No";Code[20]){
            DataClassification=ToBeClassified;
        }
        field(37;No;code[20]){
            DataClassification=ToBeClassified;
            TableRelation="G/L Account";
            trigger OnValidate()
            var 
            GLAcc: Record "G/L Account";
            begin
                if GLAcc.get(No) then
                begin
                    Rec.Category:=GLAcc.Name;
                end;
            end;
        }
        field(38;ApprovedAmount;Decimal){
            DataClassification=ToBeClassified;
        }
       field(39;Description;Text[50]){
        DataClassification = ToBeClassified;
       }
 
    }
 
    keys
    {
        key(Key1; "Fixed Assest No","Line No.")
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
 
 
    trigger OnModify()
    begin
 
    end;
 
    trigger OnDelete()
    begin
 
    end;
 
    trigger OnRename()
    begin
 
    end;
}