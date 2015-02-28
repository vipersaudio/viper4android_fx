.class public Lcom/stericson/RootTools/containers/Permissions;
.super Ljava/lang/Object;
.source "Permissions.java"


# instance fields
.field group:Ljava/lang/String;

.field other:Ljava/lang/String;

.field permissions:I

.field symlink:Ljava/lang/String;

.field type:Ljava/lang/String;

.field user:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getGroup()Ljava/lang/String;
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/stericson/RootTools/containers/Permissions;->group:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupPermissions()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/stericson/RootTools/containers/Permissions;->group:Ljava/lang/String;

    return-object v0
.end method

.method public getOther()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/stericson/RootTools/containers/Permissions;->other:Ljava/lang/String;

    return-object v0
.end method

.method public getOtherPermissions()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/stericson/RootTools/containers/Permissions;->other:Ljava/lang/String;

    return-object v0
.end method

.method public getPermissions()I
    .locals 1

    .prologue
    .line 46
    iget v0, p0, Lcom/stericson/RootTools/containers/Permissions;->permissions:I

    return v0
.end method

.method public getSymlink()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/stericson/RootTools/containers/Permissions;->symlink:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lcom/stericson/RootTools/containers/Permissions;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getUser()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/stericson/RootTools/containers/Permissions;->user:Ljava/lang/String;

    return-object v0
.end method

.method public getUserPermissions()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/stericson/RootTools/containers/Permissions;->user:Ljava/lang/String;

    return-object v0
.end method

.method public setGroup(Ljava/lang/String;)V
    .locals 0
    .param p1, "group"    # Ljava/lang/String;

    .prologue
    .line 111
    iput-object p1, p0, Lcom/stericson/RootTools/containers/Permissions;->group:Ljava/lang/String;

    .line 112
    return-void
.end method

.method public setGroupPermissions(Ljava/lang/String;)V
    .locals 0
    .param p1, "group"    # Ljava/lang/String;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/stericson/RootTools/containers/Permissions;->group:Ljava/lang/String;

    .line 87
    return-void
.end method

.method public setOther(Ljava/lang/String;)V
    .locals 0
    .param p1, "other"    # Ljava/lang/String;

    .prologue
    .line 121
    iput-object p1, p0, Lcom/stericson/RootTools/containers/Permissions;->other:Ljava/lang/String;

    .line 122
    return-void
.end method

.method public setOtherPermissions(Ljava/lang/String;)V
    .locals 0
    .param p1, "other"    # Ljava/lang/String;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/stericson/RootTools/containers/Permissions;->other:Ljava/lang/String;

    .line 92
    return-void
.end method

.method public setPermissions(I)V
    .locals 0
    .param p1, "permissions"    # I

    .prologue
    .line 76
    iput p1, p0, Lcom/stericson/RootTools/containers/Permissions;->permissions:I

    .line 77
    return-void
.end method

.method public setSymlink(Ljava/lang/String;)V
    .locals 0
    .param p1, "symlink"    # Ljava/lang/String;

    .prologue
    .line 66
    iput-object p1, p0, Lcom/stericson/RootTools/containers/Permissions;->symlink:Ljava/lang/String;

    .line 67
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/stericson/RootTools/containers/Permissions;->type:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public setUser(Ljava/lang/String;)V
    .locals 0
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 101
    iput-object p1, p0, Lcom/stericson/RootTools/containers/Permissions;->user:Ljava/lang/String;

    .line 102
    return-void
.end method

.method public setUserPermissions(Ljava/lang/String;)V
    .locals 0
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/stericson/RootTools/containers/Permissions;->user:Ljava/lang/String;

    .line 82
    return-void
.end method
