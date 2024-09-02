query 57900 ExpenseRequest
{
    QueryType = Normal;
    OrderBy=ascending(Approved_Amount);
    // QueryCategory = 'List';
    elements
    {
        dataitem(Expenses_Request; "Expenses Request")
        {
            column(Job; Job) { }
            column(Job_Task; "Job Task") { }
            column(Job_Planning_Line_No_; "Job Planning Line No.") { }

            column(FA_No; "FA No") { }
            column(Description; Description) { }
            column(Requested_Amount; "Requested Amount") { }
            column(Approved_Amount; "Approved Amount") { }
            column(Approved_By; "Approved By") { }
            column(Requested_Date; "Requested Date") { }

        }
    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}