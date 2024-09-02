pageextension 57904 VendorC extends "Vendor Card"
{
    layout
    {

    }

    actions
    {
        addafter("Vendor - Labels")
        {
            action("Send An Report")
            {
                ApplicationArea = all;
                Image=Report;
                trigger OnAction()
                var
                    Email: Codeunit "Email";
                    EmailMessage: Codeunit "Email Message";
                    EmailSetup: Record "Email Account";
                    ToAddress: Text;
                    Subject: Text;
                    body: Text;
                    instream: InStream;
                    outstream: OutStream;
                    blob: Codeunit "Temp Blob";
                    recref: RecordRef;
                    Vendor: Record Vendor;
                begin
                    // ToAddress := '2001018psr@gmail.com';
                    // Subject := 'Vendor Lists Report';
                    // body := 'Report in Pdf Format Below!!';
                    Emailmessage.Create('2001018psr@gmail.com', 'Vendor Lists Report','Report in Pdf Format Below!!');
                    recref.GetTable(Vendor);
                    blob.CreateOutStream(outstream);
                    Report.SaveAs(Report::"Vendor - List", '', ReportFormat::Pdf, outstream);
                    blob.CreateInStream(instream);
                    Emailmessage.AddAttachment('VendorList.pdf', ' ', instream);
                    email.Send(Emailmessage);


                end;

            }
        }
    }

    var
        myInt: Integer;
}