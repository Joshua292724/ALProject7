table 50127 ExampleHeader
{
    DataClassification = CustomerContent;
    Caption = 'Example Header';
    LookupPageID = "Example Document List";
    DrillDownPageID  = "Example Document List";
    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; "Document Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Document Date';
        }
        field(3; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No. Series';
        }
        field(4; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Posting Date';
        }
        field(5; "No. Printed"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'No. Printed';
            Editable = false;
        }
    }

    keys
    {
        key(Pl; "No.")
        {
            Clustered = true;
        }
    }
    var
        NoSeriesManagement: Codeunit "No. Series";
        ExampleSetup: Record "Example Setup";

    trigger OnInsert();
    begin
        if "No." = '' then begin
            ExampleSetup.Get();
            ExampleSetup.TestField("Document Nos.");
            NoSeriesManagement.AreRelated(ExampleSetup."Example Nos.",xRec."No. Series");
        end;
        InitRecord();
    end; 

    procedure AssistEdit(OldExampleHeader: Record "ExampleHeader"): Boolean
    var
        ExampleHeader: Record "ExampleHeader";
    begin
        ExampleHeader := Rec;
        ExampleSetup.Get();
        ExampleSetup.TestField("Document Nos.");
        // if NoSeriesManagement.SelectSeries(ExampleSetup."Document Nos.",
        //                                 OldExampleHeader."No. Series",
        //                                 ExampleHeader."No. Series") then begin
        //     NoSeriesManagement.SetSeries(ExampleHeader."No.");
            if NoSeriesManagement.LookupRelatedNoSeries(OldExampleHeader."No. Series",ExampleHeader."No. Series") then begin
            NoSeriesManagement.GetNextNo(ExampleHeader."No.");
            Rec := ExampleHeader;
            exit(true);
        end;
    end;

    procedure InitRecord()
    begin
        if Rec."Posting Date" = 0D then
            Rec."Posting Date" := WorkDate();
        Rec."Document Date" := WorkDate();
    end;
}