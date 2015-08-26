<?php
/** @package {$connection->DBName|studlycaps}::Model::DAO */

/** import supporting libraries */
require_once("verysimple/Phreeze/Phreezable.php");
require_once("{$singular}Map.php");

/**
 * {$singular}DAO provides object-oriented access to the {$table->Name} table.  This
 * class is automatically generated by ClassBuilder.
 *
 * WARNING: THIS IS AN AUTO-GENERATED FILE
 *
 * This file should generally not be edited by hand except in special circumstances.
 * Add any custom business logic to the Model class which is extended from this DAO class.
 * Leaving this file alone will allow easy re-generation of all DAOs in the event of schema changes
 *
 * @package {$connection->DBName|studlycaps}::Model::DAO
 * @author ClassBuilder
 * @version 1.0
 */
class {$singular}DAO extends Phreezable
{ldelim}
{foreach from=$table->Columns item=column}	/** @var {$column->GetPhpType()} */
	public ${$column->NameWithoutPrefix|studlycaps};

{/foreach}

{foreach from=$table->Sets item=set}	/**
	 * Returns a dataset of {$set->SetTableName|studlycaps} objects with matching {$set->SetKeyColumnNoPrefix|studlycaps}
	 * @param Criteria
	 * @return DataSet
	 */
	public function Get{$set->GetterName|studlycaps}($criteria = null)
	{ldelim}
		return $this->_phreezer->GetOneToMany($this, "{$set->Name}", $criteria);
	{rdelim}

{/foreach}
{foreach from=$table->Constraints item=constraint}	/**
	 * Returns the foreign object based on the value of {$constraint->KeyColumnNoPrefix|studlycaps}
	 * @return {$constraint->ReferenceTableName|studlycaps}
	 */
	public function Get{$constraint->GetterName|studlycaps}()
	{ldelim}
		return $this->_phreezer->GetManyToOne($this, "{$constraint->Name}");
	{rdelim}

{/foreach}

{rdelim}
?>