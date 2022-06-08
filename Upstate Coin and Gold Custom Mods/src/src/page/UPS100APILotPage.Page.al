page 50002 "UPS100APILotPage"
{
    APIGroup = 'NetSuite';
    APIPublisher = 'CAISoftware';
    APIVersion = 'v1.0';
    Caption = 'apiLotPage';
    DelayedInsert = true;
    EntityName = 'lot';
    EntitySetName = 'lots';
    PageType = API;
    SourceTable = "CAiRef Lot";
    ODataKeyFields = SystemId;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(vendorNo; Rec."Vendor No.")
                {
                    Caption = 'Vendor No.';
                }
                part(DetailLines; "UPS100APILotDetailLines")
                {
                    ApplicationArea = All;
                    Caption = 'Details', Locked = true;
                    EntityName = 'lotDetail';
                    EntitySetName = 'lotDetails';
                    SubPageLink = "Lot SysID" = FIELD(SystemID);
                }

            }
        }
    }

}
