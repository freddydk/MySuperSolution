page 50000 "UPS100APISettlementHdr"
{
    PageType = API;
    Caption = 'API Settlement Header';
    APIPublisher = 'CAISoftware';
    APIGroup = 'NetSuite';
    APIVersion = 'v1.0';
    EntityName = 'settlement';
    EntitySetName = 'settlements';
    SourceTable = "CAiRef Settlement Header";
    DelayedInsert = true;
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(type; Rec.Type)
                {
                    Caption = 'Type';
                }
                field(settlementNo; Rec."Settlement No.")
                {
                    Caption = 'Settlement No.';
                }
                field(lotNo; Rec."Lot No.")
                {
                    Caption = 'Lot No.';
                }
                part(settlementLines; "UPS100SettlementLines")
                {
                    ApplicationArea = All;
                    Caption = 'Settlement Lines';
                    EntityName = 'settlementLine';
                    EntitySetName = 'settlementLines';
                    SubPageLink = "Settlement No." = FIELD("Settlement No.");
                }
            }
        }
    }
}