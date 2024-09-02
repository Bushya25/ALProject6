report 57901 "FAReport"
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'FA Report';
    ApplicationArea = All;
    ExcelLayout = 'FA Report.xlsx';
    DefaultLayout = Excel;


    dataset
    {
        dataitem("Fixed Asset Movement"; "Fixed Asset Movement")
        {
            column(Fixed_Asset; "Fixed Asset") { }
            column(From_Job_No_; "From Job No.") { }
            column(To_Job_No_; "To Job No.") { }
            Column(Person_Responsible_ID; "Person Responsible ID") { }
            Column(Assgined_By; "Assgined By") { }
            column(From_Date_Time; "From Date Time") { }
            column(To_Date_Time; "To Date Time") { }
            column(E_Mail_Triggered; "E-Mail Triggered") { }
        }
    }
}