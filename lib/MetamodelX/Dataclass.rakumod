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
}

my package EXPORTHOW {
    package DECLARE {
        constant dataclass = MetamodelX::Dataclass;
    }
}
