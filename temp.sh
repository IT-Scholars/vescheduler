for i in `ls $AXIS2_HOME/lib/*.jar`;
do
echo $i
jar tvf $i | grep XmlSchema
done
