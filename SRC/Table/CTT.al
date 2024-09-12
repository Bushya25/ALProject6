table 57907 CustomerTempTable
{
    DataClassification = ToBeClassified;
    TableType = Temporary;
    DrillDownPageId = "Customer List";
    LookupPageId = "Customer List";
    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(2; Name; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Address; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(4; PhoneNo; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Email; Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; No)
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
report 57904 CustomerTempReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'CustTemp.rdl';

    dataset
    {
        dataitem(CustomerTempTable; CustomerTempTable)
        {
            column(No; No)
            {

            }
            column(Name; Name) { }
            column(Address; Address) { }
            column(PhoneNo; PhoneNo) { }
            column(Email; Email) { }
        }
    }



    trigger OnPreReport()
    var
        customerL: Record Customer;
    begin
        if CustomerL.FindSet() then
            repeat
                CustomerTempTable.Init();
                CustomerTempTable.No := customerL."No.";
                CustomerTempTable.Name := customerL.Name;
                CustomerTempTable.Address := customerL.Address;
                CustomerTempTable.PhoneNo := customerL."Phone No.";
                CustomerTempTable.Email := customerL."E-Mail";
                CustomerTempTable.Insert();
            until CustomerL.Next() = 0;
    end;



    var
        myInt: Integer;
}