report 57903 ER
{
  
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'ExpenseRequest.rdl';

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = sorting();

            column(JobNo; JobNo) { }
            column(FANo; FANo) { }
            column(RequestedAmount; RequestedAmount) { }
            column(RequestedDate; RequestedDate) { }
            column(RequestedBy; RequestedBy) { }
            column(ApprovedAmount; ApprovedAmount) { }
            column(ApprovedBy; ApprovedBy) { }
            column(ApprovedDate; ApprovedDate) { }

            trigger OnPreDataItem()
            begin

                if StartDate <> 0D then
                    ERQuery.SetRange(Requested_Date, StartDate, EndDate);
                if JobNo <> '' then
                    ERQuery.SetRange(Job, JobNo);
                ERQuery.Open();
                if not ERQuery.Read() then
                    CurrReport.Break();
                // SetRange(Number, 1, TopN);
                // ERQuery.TopNumberOfRows(TopN);
                // ERQuery.SetFilter(ApprovedDate, '%1..%2', StartDate, EndDate);
                // ERQuery.ToTopDate(StartDate);
                ERQuery.Open();


                // if JobNo <> '' then
                //     ERQuery.SetFilter(FANo, JobNo);



                // if not ERQuery.Read() then
                //     CurrReport.Break();
            end;

            trigger OnAfterGetRecord()
            begin
                if ERQuery.Read() then begin
                    FANo := ERQuery.FA_No;
                    RequestedAmount := ERQuery.Requested_Amount;
                    RequestedDate := ERQuery.Requested_Date;
                    ApprovedAmount := ERQuery.Approved_Amount;
                    ApprovedBy := ERQuery.Approved_By;

                end else begin
                    CurrReport.Break();
                end;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group("Set Filters")
                {
                    field(StartDate; StartDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Start Date';
                    }
                    field(EndDate; EndDate)
                    {
                        ApplicationArea = All;
                        Caption = 'End Date';
                    }
                    field(JobNo; JobNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Filter by Asset Number (FANo)';
                        TableRelation = Job;
                    }
                    // field(TopN; TopN)
                    // {
                    //     Caption = 'Top Records which you like to generate a report:';
                    //     ApplicationArea = All;
                    // }
                }
            }
        }
    }

    var
        ERQuery: Query "ExpenseRequest";
        FANo: Code[20];
        RequestedAmount: Decimal;
        RequestedDate: Date;
        RequestedBy: Code[30];
        ApprovedAmount: Decimal;
        ApprovedBy: Code[30];
        ApprovedDate: Date;
        JobNo: Code[20];  // This is the FANo filter
        StartDate: Date;
        EndDate: Date;
        TopN: Integer;


}
