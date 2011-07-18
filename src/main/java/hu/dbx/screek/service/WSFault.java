package hu.dbx.screek.service;

import java.util.Iterator;
import java.util.Locale;

import javax.xml.namespace.QName;
import javax.xml.soap.Detail;
import javax.xml.soap.Name;
import javax.xml.soap.SOAPElement;
import javax.xml.soap.SOAPException;
import javax.xml.soap.SOAPFault;

import org.w3c.dom.Attr;
import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.TypeInfo;
import org.w3c.dom.UserDataHandler;

public class WSFault implements SOAPFault {

	private String code;
	private String message;
	
	@Override
	public Detail addDetail() throws SOAPException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addFaultReasonText(String arg0, Locale arg1)
			throws SOAPException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void appendFaultSubcode(QName arg0) throws SOAPException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Detail getDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getFaultActor() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getFaultCode() {
		// TODO Auto-generated method stub
		return code;
	}

	@Override
	public Name getFaultCodeAsName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QName getFaultCodeAsQName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getFaultNode() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterator getFaultReasonLocales() throws SOAPException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getFaultReasonText(Locale arg0) throws SOAPException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterator getFaultReasonTexts() throws SOAPException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getFaultRole() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getFaultString() {
		// TODO Auto-generated method stub
		return message;
	}

	@Override
	public Locale getFaultStringLocale() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterator getFaultSubcodes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean hasDetail() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void removeAllFaultSubcodes() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setFaultActor(String arg0) throws SOAPException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setFaultCode(Name arg0) throws SOAPException {
		// TODO Auto-generated method stub

	}

	@Override
	public void setFaultCode(QName arg0) throws SOAPException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setFaultCode(String arg0) throws SOAPException {
		// TODO Auto-generated method stub
		this.code = arg0;
	}

	@Override
	public void setFaultNode(String arg0) throws SOAPException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setFaultRole(String arg0) throws SOAPException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setFaultString(String arg0) throws SOAPException {
		// TODO Auto-generated method stub
		this.message = arg0;
	}

	@Override
	public void setFaultString(String arg0, Locale arg1) throws SOAPException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public SOAPElement addAttribute(Name arg0, String arg1)
			throws SOAPException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SOAPElement addAttribute(QName arg0, String arg1)
			throws SOAPException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SOAPElement addChildElement(Name arg0) throws SOAPException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SOAPElement addChildElement(QName arg0) throws SOAPException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SOAPElement addChildElement(String arg0) throws SOAPException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SOAPElement addChildElement(SOAPElement arg0) throws SOAPException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SOAPElement addChildElement(String arg0, String arg1)
			throws SOAPException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SOAPElement addChildElement(String arg0, String arg1, String arg2)
			throws SOAPException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SOAPElement addNamespaceDeclaration(String arg0, String arg1)
			throws SOAPException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SOAPElement addTextNode(String arg0) throws SOAPException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QName createQName(String arg0, String arg1) throws SOAPException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterator getAllAttributes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterator getAllAttributesAsQNames() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getAttributeValue(Name arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getAttributeValue(QName arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterator getChildElements() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterator getChildElements(Name arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterator getChildElements(QName arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Name getElementName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public QName getElementQName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getEncodingStyle() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterator getNamespacePrefixes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getNamespaceURI(String arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Iterator getVisibleNamespacePrefixes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean removeAttribute(Name arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeAttribute(QName arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void removeContents() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean removeNamespaceDeclaration(String arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public SOAPElement setElementQName(QName arg0) throws SOAPException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setEncodingStyle(String arg0) throws SOAPException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void detachNode() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public SOAPElement getParentElement() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getValue() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void recycleNode() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setParentElement(SOAPElement arg0) throws SOAPException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setValue(String arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Node appendChild(Node arg0) throws DOMException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Node cloneNode(boolean arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public short compareDocumentPosition(Node arg0) throws DOMException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public NamedNodeMap getAttributes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getBaseURI() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NodeList getChildNodes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getFeature(String arg0, String arg1) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Node getFirstChild() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Node getLastChild() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getLocalName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getNamespaceURI() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Node getNextSibling() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getNodeName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public short getNodeType() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String getNodeValue() throws DOMException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Document getOwnerDocument() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Node getParentNode() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getPrefix() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Node getPreviousSibling() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getTextContent() throws DOMException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object getUserData(String arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean hasAttributes() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean hasChildNodes() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Node insertBefore(Node arg0, Node arg1) throws DOMException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean isDefaultNamespace(String arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEqualNode(Node arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isSameNode(Node arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isSupported(String arg0, String arg1) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String lookupNamespaceURI(String arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String lookupPrefix(String arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void normalize() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Node removeChild(Node arg0) throws DOMException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Node replaceChild(Node arg0, Node arg1) throws DOMException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setNodeValue(String arg0) throws DOMException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setPrefix(String arg0) throws DOMException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setTextContent(String arg0) throws DOMException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Object setUserData(String arg0, Object arg1, UserDataHandler arg2) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getAttribute(String arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getAttributeNS(String arg0, String arg1) throws DOMException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Attr getAttributeNode(String arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Attr getAttributeNodeNS(String arg0, String arg1)
			throws DOMException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NodeList getElementsByTagName(String arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NodeList getElementsByTagNameNS(String arg0, String arg1)
			throws DOMException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TypeInfo getSchemaTypeInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getTagName() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean hasAttribute(String arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean hasAttributeNS(String arg0, String arg1) throws DOMException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void removeAttribute(String arg0) throws DOMException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeAttributeNS(String arg0, String arg1) throws DOMException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Attr removeAttributeNode(Attr arg0) throws DOMException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setAttribute(String arg0, String arg1) throws DOMException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setAttributeNS(String arg0, String arg1, String arg2)
			throws DOMException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Attr setAttributeNode(Attr arg0) throws DOMException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Attr setAttributeNodeNS(Attr arg0) throws DOMException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setIdAttribute(String arg0, boolean arg1) throws DOMException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setIdAttributeNS(String arg0, String arg1, boolean arg2)
			throws DOMException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setIdAttributeNode(Attr arg0, boolean arg1) throws DOMException {
		// TODO Auto-generated method stub
		
	}

}
