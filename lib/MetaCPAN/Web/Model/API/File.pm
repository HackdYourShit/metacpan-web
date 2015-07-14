package MetaCPAN::Web::Model::API::File;
use Moose;
extends 'MetaCPAN::Web::Model::API';

sub get {
    my ( $self, @path ) = @_;
    $self->request( '/file/' . join( q{/}, @path ) );
}

sub source {
    my ( $self, @path ) = @_;
    $self->request( '/source/' . join( q{/}, @path ), undef, { raw => 1 } );
}

sub dir {
    my ( $self, @path ) = @_;
    my $path = join '/', @path;
    my $data = $self->request("/file/dir/$path")->get;
    return $data->{dir};
}

__PACKAGE__->meta->make_immutable;

1;
