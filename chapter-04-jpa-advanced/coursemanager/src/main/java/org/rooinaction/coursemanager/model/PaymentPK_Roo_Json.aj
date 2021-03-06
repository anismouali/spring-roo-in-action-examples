// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.rooinaction.coursemanager.model;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.rooinaction.coursemanager.model.PaymentPK;

privileged aspect PaymentPK_Roo_Json {
    
    public String PaymentPK.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static PaymentPK PaymentPK.fromJsonToPaymentPK(String json) {
        return new JSONDeserializer<PaymentPK>().use(null, PaymentPK.class).deserialize(json);
    }
    
    public static String PaymentPK.toJsonArray(Collection<PaymentPK> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<PaymentPK> PaymentPK.fromJsonArrayToPaymentPKs(String json) {
        return new JSONDeserializer<List<PaymentPK>>().use(null, ArrayList.class).use("values", PaymentPK.class).deserialize(json);
    }
    
}
