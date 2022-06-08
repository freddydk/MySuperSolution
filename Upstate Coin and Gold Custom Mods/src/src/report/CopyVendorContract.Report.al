Report 50000 "Copy Vendor Contract"
{
    Caption = 'Copy Vendor Contract';
    ProcessingOnly = True;

    dataset
    {
        dataitem("CAiRef Vendor Contract Header"; "CAIRef Vendor Contract Header")
        {
            DataItemTableView = SORTING("Vendor No.", "Contract No.");

            trigger OnAfterGetRecord()
            begin
                ContractDetail.SETRANGE("Vendor No.", "Vendor No.");
                ContractDetail.SETRANGE("Contract No.", "Contract No.");

                IF RefCustNo = '' THEN
                    ERROR('Copy to Vendor No. cannot be Blank');

                ContractHeaderII.init;
                ContractHeaderII.TransferFields("CAiRef Vendor Contract Header");
                ContractHeaderII."Vendor No." := RefCustNo;
                ContractHeaderII."Contract No." := '';
                ContractHeaderII.Insert(true);

                IF ContractDetail.FINDSET THEN
                    REPEAT
                        ContractDetailII.TRANSFERFIELDS(ContractDetail);
                        ContractDetailII."Vendor No." := RefCustNo;
                        ContractDetailII."Contract No." := ContractHeaderII."Contract No.";
                        ContractDetailII.INSERT;
                    UNTIL ContractDetail.NEXT = 0;

                VendorRec.GET(ContractHeaderII."Vendor No.");

                MESSAGE('Contract Copied to ' + VendorRec.Name + ' (' + VendorRec."No." + ')');

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Copy Selected Contract To:';
                    field(RefCustNo; RefCustNo)
                    {
                        Caption = 'Refining Customer Vendor No.:';
                        TableRelation = Vendor."No." where("Refining Customer" = CONST(True));
                    }
                }
            }
        }

        actions
        {
        }
    }

    var
        myInt: Integer;
        RefCustNo: Code[20];
        VendorRec: Record Vendor;
        ContractDetail: Record "CAIRef Vendor Contract Detail";
        ContractHeaderII: Record "CAIRef Vendor Contract Header";
        ContractDetailII: Record "CAIRef Vendor Contract Detail";
}