class MetamodelX::Dataclass is Metamodel::ClassHOW {

    method add_method(Mu \type, $name, $code_obj) {
        my @attribute-names =
                self.attributes( type, :local).map: *.name.substr(2,*);
        unless $code_obj.^name ~~ /Submethod/
                or $name ∈ @attribute-names {
            die "Data classes have no methods";
        }
        callsame();
    }

    method compose( Mu \obj ){
        my &call-me = anon submethod call-me(Mu $obj: *%args )  {
            $obj.new( |%args )
        };
        self.add_method( obj, "CALL-ME", &call-me);
        callsame();
    }
}

my package EXPORTHOW {
    package DECLARE {
        constant dataclass = MetamodelX::Dataclass;
    }
}
