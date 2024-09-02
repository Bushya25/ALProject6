report 57902 "Monthly Expenses"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem("Fixed Asset"; "Fixed Asset")
        {


            dataitem(SubTable; SubTable)
            {
                DataItemLink = "Fixed Assest No" = field("No.");
                column(Cost; Cost)
                {
                }

                trigger OnPreDataItem()
                var
                    FA: Record "Fixed Asset";
                begin
                 
                    FA.SetFilter("No.", FA.GetFilters);
                    SubTable.SetFilter(Period, '%1..%2', StartDate, EndDate);
                    TotalCostForCurrentFA := 0;
                end;

                trigger OnAfterGetRecord()
                begin

                    TotalCostForCurrentFA += Cost;
                    SelectedFixedAssetNo:="Fixed Asset"."No.";
                end;
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group("Set Date and Asset No.")
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
                }
            }
        }
        // trigger OnOpenPage()
        // var
        //     FixedAsset: Record "Fixed Asset";
        //     Rec: Record "Fixed Asset";
        // begin
        //     // Automatically fill the Fixed Asset No. based on the current page
        //     if Rec.Get(SelectedFixedAssetNo) then
        //         SelectedFixedAssetNo := Rec."No.";
        // end;
    }
    // trigger OnPreReport()
    // var
    //     FA: Record "Fixed Asset";
    // begin
    //     FA.SetFilter("No.", FA.GetFilters);
    // end;

    // trigger OnInitReport()
    // var
    //     FA: Record "Fixed Asset";
    // begin
    //     FA.SetFilter("No.", FA.GetFilters);
    // end;

    trigger OnPostReport()
    begin

        Message('Total cost for Fixed Asset %1 between %2 and %3 is: %4', SelectedFixedAssetNo, StartDate, EndDate, TotalCostForCurrentFA);
    end;


    var
        StartDate: Date;
        EndDate: Date;
        SelectedFixedAssetNo: Code[20];
        TotalCostForCurrentFA: Decimal;
}
