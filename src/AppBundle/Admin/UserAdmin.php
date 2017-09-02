<?php

namespace AppBundle\Admin;

use AppBundle\Entity\User;
use Sonata\AdminBundle\Form\FormMapper;
use FOS\UserBundle\Model\UserManagerInterface;
use Sonata\UserBundle\Admin\Model\UserAdmin as BaseModelUserAdmin;
use Sonata\AdminBundle\Route\RouteCollection;
use Sonata\AdminBundle\Admin\AbstractAdmin;
use Sonata\AdminBundle\Datagrid\DatagridMapper;
use Sonata\AdminBundle\Datagrid\ListMapper;
use Sonata\AdminBundle\Show\ShowMapper;

class UserAdmin extends BaseModelUserAdmin
{
    /**
     * @var UserManagerInterface
     */
    protected $userManager;

    /**
     * {@inheritdoc}
     */
    protected function configureFormFields(FormMapper $formMapper)
    {
        // define group zoning
        $formMapper
            ->tab('User')
            ->with('Profile', array('class' => 'col-md-6'))->end()
            ->with('General', array('class' => 'col-md-6'))->end()
            ->end()
        ;

        $formMapper
            ->tab('User')
            ->with('General')
            ->add('username')
            ->add('email')
            ->add('plainPassword', 'repeated', array(
                'type'=>'password',
                'first_options'  => array('label' => 'New Password'),
                'second_options' => array('label' => 'Repeat Password'),
                'required' => (!$this->getSubject() || is_null($this->getSubject()->getId())),
            ))
            ->end()
            ->with('Profile')
            ->add('firstname', null, array('required' => false))
            ->add('lastname', null, array('required' => false))
            ->add('website')
            ->add('address', null, array('required' => false))
            ->add('phone', null, array('required' => false))
            ->end()
            ->end()
        ;
    }

    /**
     * {@inheritdoc}
     */
    protected function configureDatagridFilters(DatagridMapper $filterMapper)
    {
        $filterMapper
            ->add('username')
            ->add('email')
        ;
    }


    /**
     * {@inheritdoc}
     */
    protected function configureListFields(ListMapper $listMapper)
    {
        $listMapper
            ->addIdentifier('username')
            ->add('email')
            ->add('phone')
            ->add('address')
            ->add('website')
            ->add('createdAt')
            ->add('_action', null, array(
                'actions' => array(
                    'show' => array(),
                    'edit' => array(),
                    'delete' => array(),
                )
            ))
        ;
    }

    /**
     * {@inheritdoc}
     */
    protected function configureShowFields(ShowMapper $showMapper)
    {
        $showMapper
            ->with('Profile')
            ->add('username')
            ->add('email')
            ->add('firstname')
            ->add('lastname')
            ->add('website')
            ->add('address')
            ->add('phone')
            ->end()
        ;
    }


    /**
     * @param UserManagerInterface $userManager
     */
    public function setUserManager(UserManagerInterface $userManager)
    {
        $this->userManager = $userManager;
    }

    /**
     * @return UserManagerInterface
     */
    public function getUserManager()
    {
        return $this->userManager;
    }


    /**
     * {@inheritdoc}
     */
    public function preUpdate($user)
    {
        $this->getUserManager()->updateCanonicalFields($user);
        $this->getUserManager()->updatePassword($user);
    }


    public function createQuery($context = 'list')
    {
        $qb = parent::createQuery($context);

        $thisuser = $this->getContext()->getToken()->getUser()->getId();
        $qb->andWhere(
            $qb->expr()->eq($qb->getRootAlias().'.creator',':thisuser')
        );
        $qb->setParameter('thisuser', $thisuser);

        return $qb;
    }

    /**
     * {@inheritdoc}
     */
    public function getContext()
    {
        return $this->getConfigurationPool()->getContainer()->get('security.token_storage');
    }


    /**
     * {@inheritdoc}
     */
    public function prePersist($user)
    {
        $thisuser = $this->getContext()->getToken()->getUser();
        $user->setCreator($thisuser);
        $user->setEnabled(true);
        

        $this->getUserManager()->updateCanonicalFields($user);
        $this->getUserManager()->updatePassword($user);
    }

}
