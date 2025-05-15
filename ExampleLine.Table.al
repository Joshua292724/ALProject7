table 50128 ExampleLine
{
    DataClassification = CustomerContent;
    Caption = 'Example Line';
    
    fields
    {
        field(1;"Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
            TableRelation = ExampleHeader;
            
        }
        field(2;"Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
            
        }
        field(3;"Example No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Example No.';
            TableRelation = Example;
            
        }
        field(4;"Line Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Line Date';
            
        }
        field(6;Quantity; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Quantity';
            DecimalPlaces = 0:2;
            
        }
        field(7;"Example Description"; Text[50])
        {
            Caption = 'Example Description';
            FieldClass = FlowField;
            CalcFormula = lookup(Example.Description where("No." = field("Example No.")));
        }
    }
    
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
    
    fieldgroups
    {
        // Add changes to field groups here
    } 
}