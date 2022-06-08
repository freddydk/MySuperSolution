tableextension 50001 "UPS100LotInTransit" extends "CAiRef Lot In Transit"
{
    fields
    {
        field(50000; "NetSuite P.O. No."; Code[20])
        {
            DataClassification = ToBeClassified;

        }
        field(50001; "NetSuite Internal ID No."; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
}